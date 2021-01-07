package com.donjomjo.dreamfunding.index.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donjomjo.dreamfunding.common.model.vo.PageInfo;
import com.donjomjo.dreamfunding.common.template.Pagination;
import com.donjomjo.dreamfunding.index.model.service.IndexService;
import com.donjomjo.dreamfunding.index.model.vo.Index;
import com.donjomjo.dreamfunding.index.model.vo.Like;
import com.google.gson.Gson;

@Controller
public class IndexController {
	
	@Autowired
	private IndexService iService;
	
	// 펀딩하기 클릭시 카테고리 전체보기 페이지로 이동
	@RequestMapping("categoryViewAll.in")
	public String categoryViewAll() {
		
		// /WEB-INF/views/index/categoryViewAll.jsp
		return "index/categoryViewAll";
	}
	
	// 진행중인 펀딩리스트 조회
	@ResponseBody
	@RequestMapping(value="progressList.do", produces="application/json; charset=utf-8")
	public String selectProgressFundingList() {
		
		ArrayList<Index> progressList = iService.selectProgressFundingList();
		
//		System.out.println(progressList);
		
		return new Gson().toJson(progressList);
		
	}
	
	// 랭킹리스트 조회
	@ResponseBody
	@RequestMapping(value="rankingList.do", produces="application/json; charset=utf-8")
	public String selectRankingList() {
		
		ArrayList<Index> rankingList = iService.selectRankingList();
		
		//System.out.println(rankingList);
		
		return new Gson().toJson(rankingList);
		
		
	}
	
	// 종료된 펀딩리스트 조회
	@ResponseBody
	@RequestMapping(value="closedList.do", produces="application/json; charset=utf-8")
	public String selectClosedFundingList() {
		
		ArrayList<Index> closedList = iService.selectClosedFundingList();
		
		//System.out.println(closedList);
		
		return new Gson().toJson(closedList);
		
	}
	
	// 진행중인 펀딩 더보기 클릭 시 페이지이동
	@RequestMapping("progressMore.do")
	public String selectProjectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			Model model) {

//		System.out.println(currentPage);
		int listCount = iService.selectListCount();
//		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		
		ArrayList<Index> list = iService.selectProjectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		return "index/progressFundingMore";
		
	}
	
	// 실시간 랭킹 더보기 클릭 시 페이지이동
	@RequestMapping("rankingMore.do")
	public String selectRankingList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			Model model) {

		System.out.println(currentPage);
		int listCount = iService.selectListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		
		ArrayList<Index> list = iService.selectRankingList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println(pi);
		System.out.println(list);
		
		return "index/rankingMore";
		
	}
	
	// 종료된 펀딩 더보기 클릭 시 페이지이동
	@RequestMapping("closedMore.do")
	public String closedMore() {
		
		return "index/closedFundingMore";
	}
	
	// 진행중인 펀딩(펀딩금액순) 조회
	@ResponseBody
	@RequestMapping(value="selectMoney.do", produces="application/json; charset=utf-8")
	public String selectFundingMoney() {
		
		ArrayList<Index> selectMoneyList = iService.selectFundingMoney();
		
		//System.out.println(selectMoneyList);
		
		return new Gson().toJson(selectMoneyList);
		
	}
	
	// 진행중인 펀딩(마감임박순) 조회
	@ResponseBody
	@RequestMapping(value="selectClosed.do", produces="application/json; charset=utf-8")
	public String selectClosed() {
		
		ArrayList<Index> selectClosedList = iService.selectClosed();
		
		//System.out.println(selectClosedList);
		
		return new Gson().toJson(selectClosedList);
		
	}
	// 진행중인 펀딩(최신순) 조회
	@ResponseBody
	@RequestMapping(value="selectNew.do", produces="application/json; charset=utf-8")
	public String selectNew() {
		
		ArrayList<Index> selectNewList = iService.selectNew();
		
		//System.out.println(selectNewList);
		
		return new Gson().toJson(selectNewList);
		
	}
	
	@ResponseBody
	@RequestMapping(value="likeBtn.do")
	public int updateLike(int pno, int mno) {
//		System.out.println(pno);
//		System.out.println(mno);
		
		Like like = new Like();
		
		like.setProjectNo(pno);
		like.setMemberNo(mno);
		
//		System.out.println(like);
		
		int likeYN = iService.likeYN(like); //count로 찾는거 y=1 있다 0없다 있으면 delete 없으면 insert
//		System.out.println(likeYN);
		
		int result = 0;
		if(likeYN == 0) {
			iService.increaseLike(like);
			result = 1;
			return result;
			
		}else {
			iService.deleteLike(like);
			result = 0;
			return result;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="likeList.do", produces="application/json; charset=utf-8")
	public String likeList(int mno) {
		
		ArrayList<Like> likeList = iService.likeList(mno);
		
		System.out.println(likeList);
		
		return new Gson().toJson(likeList);
		
	}

	
	

}
