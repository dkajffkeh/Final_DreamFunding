package com.donjomjo.dreamfunding.projectInsert.controller;

import static com.donjomjo.dreamfunding.common.filehandler.FileRename.fileRename;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.donjomjo.dreamfunding.projectInsert.model.service.ProjectInsertService;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;;

@Controller
public class ProjectInsertController {
	
	@Autowired
	private ProjectInsertService pService;

	@RequestMapping(value="projectinsert.pi.hy")
	public String sendToProjectInsert(Model model) {
		
		model.addAttribute("bList",pService.selectBank());
		model.addAttribute("cList",pService.selectCategory());
		model.addAttribute("proSequence", pService.selectProNo());
		model.addAttribute("pList", pService.selectProject(2));
		return "projectInsert/projectInsertForm";
		
	}
	@RequestMapping(value="projectRequest.pi.hy")
	public String insertProject(MultipartHttpServletRequest mtf,
							    ProjectInsert pi ,
							    Reward r, 
							    RewardOption o,
							    Model model, 
							    HttpSession session) {
		//파일 업로드 기능 담당메소드 호출.
		
		if(listupFiles(mtf).get(0)!=null && listupFiles(mtf).get(1)!=null ) {
		fileUploader(mtf,pi,session);
		} else {
			//에러페이지 포워딩
		}
	
		//reward 가 null 이 아닐경우
		
		if(r.getRewardList()!=null) {
		deleteEmptyArray(r,o);
		settingPronoToReward(pi,r);
		
		if(pService.insertProject(pi, r, o)>0) {
			
			return "redirect:/";
			
		} else {
			
			//에러페이지 포워딩			
		}
	
		}	
		
		
		
		return "";
	}
	
	
///////////////////////////////////////(ajaxLine)//////////////////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value="projectUrlCheck.pi.hy",produces="text/html; charset=utf-8")
	public String urlconflictCheck(String urlInput) {
		
		return pService.urlconflictCheck(urlInput);
	}
	
	@ResponseBody
	@RequestMapping(value="projectmiddleSave.pi.hy",produces="text/html; charset=utf-8")
	public String saveMiddleProject(MultipartHttpServletRequest mtf,
			MultipartFile thumbfile,
			MultipartFile profile,
		    ProjectInsert pi ,
		    Reward r, 
		    RewardOption o,
		    Model model, 
		    HttpSession session) {
		
		//존재하는 프로젝트 업데이트 해야함.
		if(pService.projectNumberCheck(pi)>0) { //업데이트 실행 해야함.
			
			
			//사진이 안올라왔을경우 null 포인터 블로킹.
			if(!listupFiles(mtf).get(0).isEmpty() && !listupFiles(mtf).get(1).isEmpty()) {
				fileUploader(mtf,pi,session);
			}
			
			//리워드가 없이 올라왔을경우 null 포인터 제거	
			if(r.getRewardList()!=null) {
				
				deleteEmptyArray(r,o);
				settingPronoToReward(pi,r);
				//프로젝트의 업로드는 이뤄졌음
				//true;
			
				if(pService.projectUpdateOnly(pi)>0) {
					//리워드 삭제
					pService.deleteReward(pi);
					
					return ""+pService.insertRewardOnly(r, o);
					
				}
		
			}
	
			return ""+pService.projectUpdateOnly(pi);
	
			
		} else { //insert 진행해야함.
		
			//사진이 안올라왔을경우 null 포인터 제거.
			if(!listupFiles(mtf).get(0).isEmpty() && !listupFiles(mtf).get(1).isEmpty()) {
				fileUploader(mtf,pi,session);
			}
			//리워드가 없이 올라왔을경우 null 포인터 제거	
			if(r.getRewardList()!=null) {
				deleteEmptyArray(r,o);
				settingPronoToReward(pi,r);
					
				//리워드 인서트까지 진행 해줘야함.
				return ""+pService.insertProject(pi, r, o);
			}
				//리워드가 없을경우 프로젝트만 인서트함.
				
				return ""+pService.insertProjectOnly(pi);
		
		}	
		
	}
/////////////////////////////////////////<일반 실행메소드 라인>///////////////////////////////////////////////////////////	
	private List<MultipartFile> listupFiles(MultipartHttpServletRequest mtf){
		
		List<MultipartFile> mlist = new ArrayList();
		
		mlist.add(mtf.getFile("thumbfile"));
		mlist.add(mtf.getFile("profile"));
		
		return mlist;
		}
			
	//파일 업로드 기능 담당하는 메소드
	private void fileUploader(MultipartHttpServletRequest mtf,ProjectInsert pi,HttpSession session) {
		
		pi.setProjectThumbnailPath(session.getServletContext().getRealPath("resources/images/projectThumbnail/"));	
		pi.setCreatorThumbnailPath(session.getServletContext().getRealPath("resources/images/creatorThumbnail/"));	
		pi.setProjectFileName(fileRename(mtf.getFile("thumbfile")));
		pi.setCreatorProfile(fileRename(mtf.getFile("profile")));
		
		try {
			listupFiles(mtf).get(0).transferTo(new File(pi.getProjectThumbnailPath()+pi.getProjectFileName()));
			listupFiles(mtf).get(1).transferTo(new File(pi.getCreatorThumbnailPath()+pi.getCreatorProfile()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//빈배열 삭제
	private void deleteEmptyArray(Reward r,RewardOption o) {
		
		for(int i = 0 ; i<r.getRewardList().size(); i++) {
			
			if(r.getRewardList().get(i).getRewardPrice()==null) {
				r.getRewardList().remove(i);
				i--;
			}
			
		}
		
		if(o.getOptionList()!=null) {
			for(int i = 0 ; i <o.getOptionList().size() ; i++) {
				
				if(o.getOptionList().get(i).getRewardContent()==null) {
					o.getOptionList().remove(i);
					i--;
				}
				
			}
			
		}
	}
	
	//넘어온 projectNo 값을 리워드에도 적용될수 있게 적용
	private void settingPronoToReward(ProjectInsert pi, Reward r) {
		
		for(int i = 0 ; i<r.getRewardList().size(); i++) {
			
			r.getRewardList().get(i).setProjectNo(pi.getProjectNo());
			
			}
			
		}
	}

