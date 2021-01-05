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
import com.donjomjo.dreamfunding.detail.model.vo.DetailReport;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReward;
import com.donjomjo.dreamfunding.detail.model.vo.DetailRewardOpt;
import com.donjomjo.dreamfunding.detail.model.vo.Like;
import com.donjomjo.dreamfunding.detail.model.vo.Reply;
import com.donjomjo.dreamfunding.member.model.vo.Member;

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
		DetailPageInfo pi = Pagination.getDetailPageInfo(listCount, currentPage, 12, 5);
		
		ArrayList<Detail> list = dService.selectDetailList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "detail/detailMainTest";
		
	}
	

	@RequestMapping(value="proDetail.de")
	public String selectDetailAll(int pno, Model model, HttpSession session){
		
		Member m = (Member)session.getAttribute("loginMem");
		int uno = m.getMemNo();
		
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
			
			return "detail/detailStory";
			
		}else { // 유효하지 않은 게시글 
			
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
	
	
}
