package com.donjomjo.dreamfunding.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.mypage.model.service.MypageService;

@Controller 
public class MypageController {
	
	@Autowired
	private MypageService fService;

	@RequestMapping("mypage.me")
	public String mypage() {
		// /WEB-INF/views/member/myPage.jsp
		return "mypage/mypageMain";
	}
	
	@RequestMapping("myFundingProject.me")
	public String mypageFundingProject() {
		return "mypage/mypageFundingProject";
	}
	
	@RequestMapping("myLikeProject.me")
	public String mypageLikeProject() {
		return "mypage/mypageLikeProject";
	}
	
	@RequestMapping("myMadeProject.me")
	public String mypageMadeProject() {
		return "mypage/mypageMadeProject";
	}
	
	@RequestMapping("optionAccount.me")
	public String optionAccount() {
		return "mypage/optionAccount";
	}
	
	@RequestMapping("optionPay.me")
	public String optionPay() {
		return "mypage/optionPay";
	}
	
	@RequestMapping("optionProfile.me")
	public String optionProfile() {
		return "mypage/optionProfile";
	}
}
