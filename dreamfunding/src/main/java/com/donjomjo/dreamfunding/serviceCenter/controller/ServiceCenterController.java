package com.donjomjo.dreamfunding.serviceCenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.donjomjo.dreamfunding.serviceCenter.model.service.ServiceCenterService;
import com.donjomjo.dreamfunding.serviceCenter.model.template.PageNation;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Council;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Faq;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Notice;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.PageInfo;

@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService scService;
	
	@RequestMapping("scenterMain.gn")
	public String selectNoticeList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model){
				
		int listCount = scService.selectListCount();		
		
		
		PageInfo pi = PageNation.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = scService.selectNoticeList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		
		return "serviceCenter/sCenterMainView";
	}
	
	
	@RequestMapping("enrollForm.gn.no")
	public String noticeEnrollForm() {
		return "serviceCenter/noticeEnrollForm";
	}
	
	@RequestMapping("detail.gn.no")
	public String selectNotice(int nno, Model model) {
		int result = scService.increaseCount(nno);
		
		if(result > 0) {
			
			Notice n = scService.selectNotice(nno);
			
			model.addAttribute("n", n);
			
			return "serviceCenter/noticeDetailView";
			
		}else {
			model.addAttribute("errorMsg", "조회수 증가에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
		
	}
	
	@RequestMapping("noticeInsert.gn.no")
	public String insertNotice(Notice n, Model model) {
		int result = scService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:scenterMain.gn";
		}else {
			
			model.addAttribute("errorMsg", "공지사항 작성에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
	}
	
	@RequestMapping("noticeUpdate.gn.no")
	public String updateNotice(Notice n, Model model) {
		int result = scService.updateNotice(n);
		
		if(result > 0) {
			return "redirect:detail.gn.no?nno=" + n.getNoticeNo();
		}else {
			
			model.addAttribute("errorMsg", "공지사항 수정에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
	}
	
	@RequestMapping("delete.gn.no")
	public String deleteNotice(int nno, Model model) {
		
		int result = scService.deleteNotice(nno);
		
		if(result > 0) {
			return "redirect:scenterMain.gn";
		}else {
			model.addAttribute("errorMsg", "공지사항 삭제에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
	}
	@RequestMapping("updateForm.gn.no")
	public String updateForm(int nno, Model model) {
		
		model.addAttribute("n", scService.selectNotice(nno));
		return "serviceCenter/noticeUpdateForm";
	}
	
	@RequestMapping("faqList.gn.no")
	public String faqList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, int ctno, Model model) {
		
		int listCount = scService.selectFaqListCount(ctno);
		PageInfo pi = PageNation.getPageInfo(listCount, currentPage, 10, 6);
		
		ArrayList<Faq> list = scService.selectFaqList(pi, ctno);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "serviceCenter/faqList";
	}
	
	@RequestMapping("faqEnrollForm.gn.no")
	public String faqEnrollForm() {
		return "serviceCenter/faqEnrollForm";
	}
	
	@RequestMapping("faqInsert.gn.no")
	public String insertFaq(Faq fq, HttpSession session, Model model) {
		
		int result = scService.insertFaq(fq);
		
		if(result > 0) {			
			return "redirect:faqList.gn.no?ctno=1";
		}else {			
			return "redirect:faqList.gn.no?ctno=2";
		}
	}
	
	@RequestMapping("faqUpdateForm.gn.no")
	public String updateFormFaq(int fno, Model model) {
		
		Faq fq = scService.selectFaq(fno);
		
		model.addAttribute("fq", fq);
		
		return "serviceCenter/faqUpdateForm";
	}
	@RequestMapping("faqUpdate.gn.no")
	public String updateFaq(Faq fq) {
		int result = scService.updateFaq(fq);
		
		if(result > 0) {
			return "redirect:faqList.gn.no?ctno=1";
		}else {
			return "redirect:faqList.gn.no?ctno=2";
		}
		
	}
	
	@RequestMapping("faqDelete.gn.no")
	public String deleteFaq(int fno) {
		
		scService.deleteFaq(fno);
		
		return "redirect:faqList.gn.no?ctno=1";
		
	}
	
	@RequestMapping("councilList.gn.no")
	public String councilList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="mno", defaultValue="0")int mno, Model model) {
		
		if(mno == 0) {
			model.addAttribute("errorMsg", "로그인이 필요한 페이지입니다.");
			
			return "serviceCenter/errorPage";
			
		}else {
		
		int status = scService.selectStatus(mno);
		
		int listCount = 0;
		ArrayList<Council> list = null;
		PageInfo pi = null;
		if(status == 2) {		
		listCount = scService.selectCouncilCountAd();
		pi = PageNation.getPageInfo(listCount, currentPage, 10, 10);
		list = scService.selectCouncilListAd(pi);
		}else{
		listCount = scService.selectCouncilCount(mno);
		pi = PageNation.getPageInfo(listCount, currentPage, 10, 10);
		list = scService.selectCouncilList(pi,mno);
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "serviceCenter/councilListView";
		}
	}
	
	@RequestMapping("councilDetail.gn.no")
	public String selectCouncil(int cno, Model model) {
		
		Council co = scService.selectCouncil(cno);
		
		model.addAttribute("co", co);
		
		return "serviceCenter/councilDetailView";
		
	}
	
	@RequestMapping("coucilEnrollForm.gn.no")
	public String councilEnrollForm() {
		
		return "serviceCenter/councilEnrollForm";
	}
	
	@RequestMapping("councilInsert.gn.no")
	public String councilInsert(Council co, Model model) {
		
		int result = scService.insertCouncil(co);
		
		if(result > 0) {
			return "redirect:councilList.gn.no?mno=" + co.getMemberNo();
		}else {
			model.addAttribute("errorMsg", "문의 작성에 실패했습니다.");
			return "serviceCenter/errorPage";			
		}
		
	}
	
	@RequestMapping("councilUpdateForm.gn.no")
	public String councilUpdateForm(int cno, Model model) {
		
		Council co = scService.selectCouncil(cno);
		
		model.addAttribute("co", co);
		
		return "serviceCenter/councilUpdateForm";
		
	}
	
	@RequestMapping("councilUpdate.gn.no")
	public String councilUpdate(Council co, Model model) {
		
		int result = scService.updateCouncil(co);
		
		if(result > 0) {
			return "redirect:councilDetail.gn.no?cno="+co.getCouncilNo();
		}else {
			model.addAttribute("errorMsg", "문의 수정에 실패했습니다.");
			return "serviceCenter/errorPage";	
		}
	}
	
	@RequestMapping("councilDelete.gn.no")
	public String councilDelete(int cno, Model model) {
		
		
		
		int result = scService.deleteCouncil(cno);
		
		if(result > 0) {
			return "redirect:scenterMain.gn";
		}else {
			model.addAttribute("errorMsg", "문의 삭제에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
	}
	@RequestMapping("answerEnrollFrom.gn.no")
	public String answerEnrollForm(int cno, Model model) {
		
		Council co = scService.selectCouncil(cno);
		
		model.addAttribute("co", co);
		
		return "serviceCenter/councilAnswerEnrollForm";
		
	}
	
	@RequestMapping("answerInsert.gn.no")
	public String answerInsert(Council co, Model model) {
		
		int result = scService.insertCouncilAns(co);
		
		if(result > 0) {
			
			return "redirect:councilDetail.gn.no?cno="+co.getCouncilNo();
			
		}else {
			model.addAttribute("errorMsg", "답변 작성에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
		
	}
	@RequestMapping("answerUpdateForm.gn.no")
	public String answerUpdateForm(int cno, Model model) {
		
		Council co = scService.selectCouncil(cno);
		
		model.addAttribute("co", co);
		
		return "serviceCenter/councilAnswerUpdateForm";
		
	}
	
	@RequestMapping("answerUpdate.gn.no")
	public String answerUpdate(Council co, Model model) {
		
		int result = scService.updateCouncilAns(co);
		
		if(result > 0 ) {
			return "redirect:councilDetail.gn.no?cno="+co.getCouncilNo();
		}else {
			model.addAttribute("errorMsg", "답변 수정에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
		
	}
	@RequestMapping("answerDelete.gn.no")
	public String answerDelete(int cno, Model model) {
		
		int result = scService.deleteCouncilAns(cno);
		
		if(result > 0 ) {
			return "redirect:councilDetail.gn.no?cno="+cno;
		}else {
			model.addAttribute("errorMsg", "답변 삭제에 실패했습니다.");
			return "serviceCenter/errorPage";
		}
	}
	
	@RequestMapping("searchNotice.gn.no")
	public String searchNotice(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model, String cate, String keyword) {
		
		int listCount = scService.searchNoticeCount(cate, keyword);
		
		PageInfo pi = PageNation.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = scService.searchNoticeList(pi, cate, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		
		return "serviceCenter/sCenterMainView";
		
	}
	
}
