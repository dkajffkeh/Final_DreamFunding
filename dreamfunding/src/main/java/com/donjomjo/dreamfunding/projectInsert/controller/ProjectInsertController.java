package com.donjomjo.dreamfunding.projectInsert.controller;

import static com.donjomjo.dreamfunding.common.filehandler.FileRename.fileRename;
import static com.donjomjo.dreamfunding.common.filehandler.FileRenameStringType.fileRenameString;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.donjomjo.dreamfunding.projectInsert.model.service.ProjectInsertService;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.CKEDitor;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.istack.internal.logging.Logger;
import com.sun.xml.internal.ws.util.StringUtils;;

@Controller
public class ProjectInsertController {
	
	@Autowired
	private ProjectInsertService pService;
	

	@RequestMapping(value="projectinsert.pi.hy")
	private String sendToProjectInsert(Model model) {
		
		model.addAttribute("bList",pService.selectBank());
		model.addAttribute("cList",pService.selectCategory());
		model.addAttribute("proSequence", pService.selectProNo());
		model.addAttribute("pList", pService.selectProject(2));
		return "projectInsert/projectInsertForm";
		
	}
	@RequestMapping(value="projectRequest.pi.hy")
	private String insertProject(MultipartHttpServletRequest mtf,
							    ProjectInsert pi ,
							    Reward r, 
							    RewardOption o,
							    Model model, 
							    HttpSession session,
							    String actionType) {
		
		//actionType => insert 일경우 즉 불러오기를 해서 제출한것이 아닌 작성후 바로 제출하게 된 케이스.
			if(actionType.equals("insert")) {				
				insertProject(mtf,pi,r,o,model,session);
			} 
			//불러오기가 실행 된후 인서트.
			if(actionType.equals("Reload")) {
				
				updateProject(mtf,pi,r,o,model,session);
			}
		
			
		return "redirect:/";
	}
	//actionType => insert 일경우 즉 불러오기를 해서 제출한것이 아닌 작성후 바로 제출하게 된 케이스.
	private void insertProject(
			MultipartHttpServletRequest mtf,
		    ProjectInsert pi ,
		    Reward r, 
		    RewardOption o,
		    Model model, 
		    HttpSession session) 
	{
			
		if(!listupFiles(mtf).get(0).isEmpty() && !listupFiles(mtf).get(1).isEmpty()) {
			fileUploader(mtf,pi,session);
			} 
		
			//reward 가 null 이 아닐경우
			
			deleteEmptyArray(r,o);
			settingPronoToReward(pi,r);
			pService.insertProject(pi, r, o);
			
		
	}
	//actionType => Reload 일 경우 불러오기를 한 후 이용하는 update문
	private void updateProject(
			MultipartHttpServletRequest mtf,
		    ProjectInsert pi ,
		    Reward r, 
		    RewardOption o,
		    Model model, 
		    HttpSession session) 
	{		
		
		//사진이 새로 올라오게 된 케이스
		if(!listupFiles(mtf).get(0).isEmpty() || !listupFiles(mtf).get(1).isEmpty()) {	
			
			if(!thumbFileparsing(mtf).isEmpty()) {
				//fileUploader(mtf,pi,session);
				new File(session.getServletContext().getRealPath("resources/images/projectThumbnail/")+pService.selectProfile(pi.getProjectNo())).delete();
				thumbnailUploader(thumbFileparsing(mtf),pi,session);
			}
			
			if(!profileParsing(mtf).isEmpty()) {
				
				new File(session.getServletContext().getRealPath("resources/images/creatorThumbnail/")+pService.selectThumbnail(pi.getProjectNo())).delete();
				profileUploader(profileParsing(mtf),pi,session);
			}
			//DB에서 파일을 불러 온 후 삭제				
			//2개 다 바꿨을때만 처리됨.	
				
			//프로젝트는 무조건 insert 돼야함.
			if(pService.projectUpdateOnly(pi)>0) {
						
				deleteEmptyArray(r,o);
				settingPronoToReward(pi,r);
				pService.deleteReward(pi);
				pService.insertRewardOnly(r, o);
							
			}
		  //사진은 안올라온 케이스. 그냥 업데이트만 하면됨.
		} else  {
		
			    if(pService.projectUpdateOnly(pi)>0) {				
			   	
			    deleteEmptyArray(r,o);
				settingPronoToReward(pi,r);	
				pService.deleteReward(pi);		
				pService.insertRewardOnly(r, o);			    
				
			}
			
		}
		
		
	}
	
	@RequestMapping(value="aaaabbbb.pi.hy")
	public String toPreview(int pno,Model model) {
		/*
		model.addAttribute("project", pService.ajaxProjectSelector(pi.getProjectNo()));
		model.addAttribute("rList", pService.ajaxRewardSelector(pi.getProjectNo()));
		ArrayList<Reward> rList = pService.ajaxRewardSelector(pi.getProjectNo());
		
		String [] opList = new String[rList.size()];
		
		for(int i = 0 ; i<rList.size(); i++) {
			
			opList[i] = ""+rList.get(i).getRewardNo();
			
		}
		System.out.println(pi);
		System.out.println(pService.ajaxRewardSelector(pi.getProjectNo()));
		System.out.println(Arrays.toString(opList));
		*/
		System.out.println(pno);
		return "projectInsert/projectPreview";
	}
	
	
///////////////////////////////////////(ajaxLine)//////////////////////////////////////////////////////
	
	@ResponseBody
	@RequestMapping(value="projectmiddleSave.pi.hy",produces="text/html; charset=utf-8")
	private String saveMiddleProject(MultipartHttpServletRequest mtf,
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
			if(!thumbFileparsing(mtf).isEmpty()) {
				//fileUploader(mtf,pi,session);
				thumbnailUploader(thumbFileparsing(mtf),pi,session);
			}
			
			if(!profileParsing(mtf).isEmpty()) {
				profileUploader(profileParsing(mtf),pi,session);
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
			//사진이 안올라왔을경우 null 포인터 블로킹.
			if(!thumbFileparsing(mtf).isEmpty()) {
				//fileUploader(mtf,pi,session);
				
				thumbnailUploader(thumbFileparsing(mtf),pi,session);
			}
			
			if(!profileParsing(mtf).isEmpty()) {
			
				profileUploader(profileParsing(mtf),pi,session);
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
	
	@ResponseBody
	@RequestMapping(value="projectReload.pi.hy", produces="application/json; charset=utf-8")
	private String ajaxProjectSelector(int pno){
		
		return new Gson().toJson(pService.ajaxProjectSelector(pno));
	}
	
	@ResponseBody
	@RequestMapping(value="rewardReload.pi.hy", produces="application/json; charset=utf-8")
	private String ajaxRewardSelector(int pno){
		
		return new Gson().toJson(pService.ajaxRewardSelector(pno));
	}
	
	@ResponseBody
	@RequestMapping(value="optionReload.pi.hy", produces="application/json; charset=utf-8")
	private String ajaxOptionSelector(HttpServletRequest request){
		
		if(request.getParameterValues("rList[]")==null) {
			return "empty";
		} else {
		return new Gson().toJson(pService.ajaxOptionSelector(request.getParameterValues("rList[]")));
		}
	}
	
	@ResponseBody
	@RequestMapping(value="projectUrlCheck.pi.hy",produces="text/html; charset=utf-8")
	private String urlconflictCheck(String urlInput) {
		
		return pService.urlconflictCheck(urlInput);
	}
	
	@ResponseBody
	@RequestMapping(value="ReloadProjectUrlCheck.pi.hy", produces="text/html; charset=utf-8")
	private String reloadUrlConflictCheck(String urlInput, String pno){		
			
		return pService.reloadUrlConflictCheck(urlInput, pno);
	}	
	
	@RequestMapping(value="fileupload.bo", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	private void fileUploader(MultipartHttpServletRequest multifile,HttpSession session,HttpServletRequest req,HttpServletResponse res) throws IOException {
			
		JSONObject jObj = new JSONObject();		
		
		MultipartFile file = multifile.getFile("upload");
		String fileRename = fileRenameString(file.getOriginalFilename());
	    try {
			file.transferTo(new File(session.getServletContext().getRealPath("resources/images/CKEDitor/")+fileRename));
			
			
	    } catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    jObj.put("uploaded", pService.insertCKEDitor(fileRename,session.getServletContext().getRealPath("resources/images/CKEDitor/")));
	    jObj.put("fileName", fileRename);
	    jObj.put("url", req.getContextPath()+"/resources/images/CKEDitor/"+fileRename);
	    
	    res.getWriter().print(jObj);
	}
	
/////////////////////////////////////////<일반 실행메소드 라인>///////////////////////////////////////////////////////////	
	private List<MultipartFile> listupFiles(MultipartHttpServletRequest mtf){
		
		List<MultipartFile> mlist = new ArrayList();
		
		mlist.add(mtf.getFile("thumbfile"));
		mlist.add(mtf.getFile("profile"));
		
		return mlist;
		}	
	
	private MultipartFile thumbFileparsing(MultipartHttpServletRequest mtf) {
		
		return mtf.getFile("thumbfile");
	}
	private MultipartFile profileParsing(MultipartHttpServletRequest mtf) {
			
		return mtf.getFile("profile");
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
	
	private void thumbnailUploader(MultipartFile mtf,ProjectInsert pi,HttpSession session) {
		
		pi.setProjectThumbnailPath(session.getServletContext().getRealPath("resources/images/projectThumbnail/"));
		pi.setProjectFileName(fileRenameString(mtf.getOriginalFilename()));
		
		try {
			mtf.transferTo(new File(pi.getProjectThumbnailPath()+pi.getProjectFileName()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void profileUploader(MultipartFile mtf,ProjectInsert pi,HttpSession session) {
		
		pi.setCreatorThumbnailPath(session.getServletContext().getRealPath("resources/images/creatorThumbnail/"));
		pi.setCreatorProfile(fileRenameString(mtf.getOriginalFilename()));
		
		try {
			mtf.transferTo(new File(pi.getCreatorThumbnailPath()+pi.getCreatorProfile()));
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

