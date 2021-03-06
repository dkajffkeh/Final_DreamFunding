package com.donjomjo.dreamfunding.detail.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donjomjo.dreamfunding.detail.Pagination;
import com.donjomjo.dreamfunding.detail.model.dao.DetailDao;
import com.donjomjo.dreamfunding.detail.model.service.DetailService;
import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.detail.model.vo.DetailPageInfo;
import com.donjomjo.dreamfunding.detail.model.vo.DetailPurchase;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReport;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReward;
import com.donjomjo.dreamfunding.detail.model.vo.DetailRewardOpt;
import com.donjomjo.dreamfunding.detail.model.vo.Like;
import com.donjomjo.dreamfunding.detail.model.vo.Reply;
import com.donjomjo.dreamfunding.detail.model.vo.SubReply;
import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.google.gson.Gson;

import oracle.net.aso.r;

@Controller 
public class DetailController {

	@Autowired
	private DetailService dService;
	
	@Autowired
	private DetailDao dDao;
	
	@RequestMapping(value="detailStory.de")
	public String selectDetailList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			Model model) {
		
		int listCount = dService.selectListCount();
		DetailPageInfo pi = Pagination.getDetailPageInfo(listCount, currentPage, 12, 8);
		
		ArrayList<Detail> list = dService.selectDetailList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "detail/detailMainTest";
		
	}
	

	@RequestMapping(value="proDetail.de")
	public String selectDetailAll(int pno, Model model, HttpSession session, Integer page){
		
		Member m = (Member)session.getAttribute("loginMem");
		int uno = 21; // 기본값(안쓰는 유저넘버)
		
		if(m != null ) {
			uno = m.getMemNo(); // 실제 로그인 된 유저 넘버
		}
		
		// 조회수 증가 
		int result = dService.increaseDetailCount(pno); 
		
		Like lk = new Like();
		
		if(result>0) { // 유효한 게시글 
			Detail d = dService.selectDetailAll(pno);
			// pno과 일치하는 게시글 Detail 객체에 담기
			
			model.addAttribute("d", d); 
			// d라는 키값으로 detail객체 담기
		
			ArrayList<DetailReward> rw = dService.selectDetailReward(pno);
		
			model.addAttribute("rw", rw);
			
			lk.setMemberNo(uno);
			lk.setProjectNo(pno);
			
			int resultLike = dService.selectLike(lk);
			
			model.addAttribute("lk", resultLike);
			

			// 댓글 
			ArrayList<Reply> replyList = dService.selectReply(pno);
		
			// 대댓글 
			for(Reply r: replyList) {
				int rno = r.getReplyNo();
				ArrayList<SubReply> subList = dService.selectSubReply(rno);
				r.setSubReply(subList);
			}
			
			// System.out.println("replyList: " + replyList);
			model.addAttribute("rl", replyList);
			
			
			ArrayList<DetailPurchase> dp = dService.selectDetailPurchase(pno);
			
			int totalPrice = 0;
			int totalAmount = 0;
			
			for( DetailPurchase p : dp  ) {
				totalPrice = totalPrice + (p.getRePrice()*p.getRewardAmount());
				totalAmount = totalAmount + (p.getRewardAmount());
			}
			
			model.addAttribute("tp", totalPrice);
			model.addAttribute("ta", totalAmount);
			
			int detailPage = page == null ? 1 : page;
			
			if(detailPage == 1) {
				return "detail/detailStory";
			}else if(detailPage == 2){
				return "detail/detailCommunity";
			}
			else {
				return "detail/detailPolicy";
			}
					
			
		}else{ // 유효하지 않은 게시글 
			
			model.addAttribute("errorMsg", "존재하지 않거나 삭제된 프로젝트입니다.");
			return "detail/errorPage";
		}


}

	@ResponseBody
	@RequestMapping(value="report.de")
	public String insertReport(int pno, int memNo, DetailReport report, String reportContent, Model model) {
		
		DetailReport rp = new DetailReport();	
		rp.setProjectNo(pno);
		rp.setReportContent(reportContent);
		rp.setMemberNo(memNo);
	    // System.out.println(rp);
		
		int result = dService.insertReport(rp);
		// System.out.println(result);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="like.de")
	public String insertDetailLike(int pno, int memNo, Like like, Model model) {

		Like lk = new Like();

		lk.setMemberNo(memNo);
		lk.setProjectNo(pno);
		
		int result=dService.insertLike(lk);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="deletelike.de")
	public String deleteDetailLike(int pno, int memNo, Like like, Model model) {

		Like lk = new Like();

		lk.setMemberNo(memNo);
		lk.setProjectNo(pno);
		
		int result=dService.deleteLike(lk);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	@RequestMapping(value="selectReply.de")
	public String selectReply(int pno, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginMem");
		int uno = 21; // 기본값(안쓰는 유저넘버)
		
		if(m != null ) {
			uno = m.getMemNo(); // 실제 로그인 된 유저 넘버
		}
		
		Like lk = new Like();
		
		int result = dService.increaseDetailCount(pno); 
		
		if(result>0) { // 유효한 게시글 
			Detail d = dService.selectDetailAll(pno);
			// pno과 일치하는 게시글 Detail 객체에 담기
			
			model.addAttribute("d", d); 
			// d라는 키값으로 detail객체 담기
		
			ArrayList<DetailReward> rw = dService.selectDetailReward(pno);
		
			model.addAttribute("rw", rw);

			lk.setMemberNo(uno);
			lk.setProjectNo(pno);
			
			int resultLike = dService.selectLike(lk);
			
			model.addAttribute("lk", resultLike);
			
			// 댓글 
			ArrayList<Reply> replyList = dService.selectReply(pno);
		
			// 대댓글 
			for(Reply r: replyList) {
				int rno = r.getReplyNo();
				ArrayList<SubReply> subList = dService.selectSubReply(rno);
				r.setSubReply(subList);
			}
			
			// System.out.println("replyList: " + replyList);
			model.addAttribute("rl", replyList);
			
			
			ArrayList<DetailPurchase> dp = dService.selectDetailPurchase(pno);
			// System.out.println(dp);
			
			int totalPrice = 0;
			int totalAmount = 0;
			
			for( DetailPurchase p : dp  ) {
				totalPrice = totalPrice + (p.getRePrice()*p.getRewardAmount());
				totalAmount = totalAmount + (p.getRewardAmount());
			}
			
			model.addAttribute("tp", totalPrice);
			model.addAttribute("ta", totalAmount);
			
			
			return "detail/detailCommunity";
			

		}else { // 유효하지 않은 게시글 
			
			model.addAttribute("errorMsg", "존재하지 않거나 삭제된 프로젝트입니다.");
			return "detail/errorPage";
		}
	}
	

	
	@RequestMapping(value="insertReply.de")
	public String insertReply(int pno, String replyContent, Model model, HttpSession session) {
	
		Member m = (Member)session.getAttribute("loginMem");
		int uno = m.getMemNo();
		
		Reply rp = new Reply();
		
		rp.setMemberNo(uno);
		rp.setProjectNo(pno);
		rp.setReplyContent(replyContent);
		
		int result = dService.insertReply(rp);
		
		return "redirect:selectReply.de?pno="+pno;
	}	
	
	@ResponseBody
	@RequestMapping(value="updateReply.de")
	public String updateReply(int rno, String replyContent) {
		
		Reply rp = new Reply();
		
		rp.setReplyContent(replyContent);
		rp.setReplyNo(rno);
		
		int result = dService.updateReply(rp);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("deleteReply.de")
	public String deleteReply(int rno) {
		
		int result = dService.deleteReply(rno);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="insertSubReply.de", produces="application/json; charset=utf-8")
	public String insertSubReply(int rno, String replyContent, Model model, HttpSession session) {
	
		Member m = (Member)session.getAttribute("loginMem");
		int uno = m.getMemNo();
		
		Reply rp = new Reply();
		
		rp.setMemberNo(uno);
		rp.setReplyNo(rno);
		rp.setReplyContent(replyContent);
			
		int result = dService.insertSubReply(rp);
		
		if(result>0) {
			ArrayList<SubReply> sr = dService.selectSubReplyOne(rp);
			String json = new Gson().toJson(sr);
			return json;
		}else {
			return "fail";
		}
	
	}	
	
	
	@ResponseBody
	@RequestMapping(value="updateSubReply.de")
	public String updateSubReply(int rno, String subReplyContent) {
		
		Reply rp = new Reply();
		
		rp.setReplyContent(subReplyContent);
		rp.setReplyNo(rno);
		
		int result = dService.updateSubReply(rp);

		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}

	@ResponseBody
	@RequestMapping("deleteSubReply.de")
	public String deleteSubReply(int sno) {
		
		int result = dService.deleteSubReply(sno);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
	
}
