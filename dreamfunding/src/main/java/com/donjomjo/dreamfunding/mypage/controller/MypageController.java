package com.donjomjo.dreamfunding.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MypageController {

	@RequestMapping("mypage.me")
	public String mypage() {
		// /WEB-INF/views/member/myPage.jsp
		return "mypage/mypageMain";
	}
	
	@RequestMapping("mypageFundingProject.me")
	public String mypageFundingProject() {
		return "mypage/mypageFundingProject";
	}
}
