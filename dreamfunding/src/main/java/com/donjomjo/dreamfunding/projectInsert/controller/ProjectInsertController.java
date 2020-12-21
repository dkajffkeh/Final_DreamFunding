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
		fileUploader(mtf,pi,session);
		//reward 와 oprion 에서 지워진 배열을 모두 삭제
		deleteEmptyArray(r,o);
		//
		settingPronoToReward(pi,r);
			
		
		if(pService.insertProject(pi, r, o)>0) {
			
			System.out.println("성공");
			
		} else {
			System.out.println("실패");
		}
		
		
		
		return "";
	}
	
	//파일 업로드 기능 담당하는 메소드
	private void fileUploader(MultipartHttpServletRequest mtf,ProjectInsert pi,HttpSession session) {
		
		pi.setProjectThumbnailPath(session.getServletContext().getRealPath("resources/images/projectThumbnail/"));	
		pi.setCreatorThumbnailPath(session.getServletContext().getRealPath("resources/images/creatorThumbnail/"));	
		pi.setProjectFileName(fileRename(mtf.getFile("thumbfile")));
		pi.setCreatorProfile(fileRename(mtf.getFile("profile")));
		
		List<MultipartFile> mlist = new ArrayList<>();
		mlist.add(mtf.getFile("thumbfile"));
		mlist.add(mtf.getFile("profile"));
	
		try {
			mlist.get(0).transferTo(new File(pi.getProjectThumbnailPath()+pi.getProjectFileName()));
			mlist.get(1).transferTo(new File(pi.getCreatorThumbnailPath()+pi.getCreatorProfile()));
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
	
	for(int i = 0 ; i <o.getOptionList().size() ; i++) {
			
		if(o.getOptionList().get(i).getRewardContent()==null) {
			o.getOptionList().remove(i);
			i--;
			}
			
			}
	
		}
	
	//넘어온 projectNo 값을 리워드에도 적용될수 있게 적용
	private void settingPronoToReward(ProjectInsert pi, Reward r) {
		
		for(int i = 0 ; i<r.getRewardList().size(); i++) {
						
			r.getRewardList().get(i).setProjectNo(pi.getProjectNo());
			
		}

	}
	
///////////////////////////////////////(ajaxLine)//////////////////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value="projectUrlCheck.pi.hy",produces="text/html; charset=utf-8")
	public String urlconflictCheck(String urlInput) {
		
		return pService.urlconflictCheck(urlInput);
	}
	
		
	}

