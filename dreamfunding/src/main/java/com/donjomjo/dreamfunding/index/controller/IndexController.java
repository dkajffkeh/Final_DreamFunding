package com.donjomjo.dreamfunding.index.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donjomjo.dreamfunding.index.model.service.IndexService;
import com.donjomjo.dreamfunding.index.model.vo.Index;
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
		
		//System.out.println(progressList);
		
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
	public String progressMore() {
		
		return "index/progressFundingMore";
	}
	
	// 실시간 랭킹 더보기 클릭 시 페이지이동
	@RequestMapping("rankingMore.do")
	public String rankingMore() {
		
		return "index/rankingMore";
	}
	
	// 종료된 펀딩 더보기 클릭 시 페이지이동
	@RequestMapping("closedMore.do")
	public String closedMore() {
		
		return "index/closedFundingMore";
	}
	
	
	
	
	

}
