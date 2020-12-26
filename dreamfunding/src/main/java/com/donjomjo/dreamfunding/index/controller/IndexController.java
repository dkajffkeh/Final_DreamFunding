package com.donjomjo.dreamfunding.index.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.index.model.service.IndexService;
import com.donjomjo.dreamfunding.index.model.vo.Index;

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
	
	// selectProgressFundingList() 진행중인 펀딩리스트 조회
//	@RequestMapping("list.bo")	// list.bo?currentPage=XX
//	public String selectBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
//								Model model) {
//		
//		
//		ArrayList<Board> list = bService.selectBoardList(pi);
//		
//		model.addAttribute("pi", pi);
//		model.addAttribute("list", list);
//		
//		return "board/boardListView";
//		
//	}
	
	/*
	@RequestMapping("progressList.in")
	public String selectProgressFundingList(Model model) {
		
		ArrayList<Index> progressList = iService.selectProgressFundingList();
		
		model.addAttribute("progressList", progressList);
		
		return "main";
		
		
	}
	*/
	
	@RequestMapping("/")
	public String selectProgressFundingList(Model model) {
		
		ArrayList<Index> progressList = iService.selectProgressFundingList();
		
		model.addAttribute("progressList", progressList);
		
		return "main";
		
		
	}
	
	
	
	
	
	
	

}
