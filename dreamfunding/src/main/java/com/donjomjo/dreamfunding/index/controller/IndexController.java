package com.donjomjo.dreamfunding.index.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.index.model.service.IndexService;

@Controller
public class IndexController {
//	
//	@Autowired
//	private IndexService iService;
	
	// 펀딩하기 클릭시 카테고리 전체보기 페이지로 이동
	@RequestMapping("categoryViewAll.in")
	public String categoryViewAll() {
		
		// /WEB-INF/views/member/memberEnrollForm.jsp
		return "index/categoryViewAll";
	}
	
	

}
