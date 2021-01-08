package com.donjomjo.dreamfunding.mypage.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.donjomjo.dreamfunding.mypage.common.MypagePagination;
import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.service.MypageService;

@Controller 
public class MypageController {
	
	@Autowired
	private MypageService myService;

	//mypage 이동
	@RequestMapping("mypage.me")
	public String mypage() {
		// /WEB-INF/views/member/myPage.jsp
		return "mypage/mypageMain";
	}
	// 펀딩한 프로젝트 
	@RequestMapping("myFundingProject.me")
	public String selectFundingList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
						 int mno, Model model) {
		int listCount = myService.selectFundingListCount(mno);
		MypagePageInfo mypi = MypagePagination.getMypagePageInfo(listCount, currentPage, 5, 5);
		
		List<Object> list = myService.selectFundingList(mno, mypi);
		
		System.out.println(listCount);
		System.out.println(mypi);
		System.out.println(list);
		
		model.addAttribute("mypi", mypi);
		model.addAttribute("list", list);
		
		return "mypage/mypageFundingProject";
	}
	// 관심있는 프로젝트 
	@RequestMapping("myLikeProject.me")
	public String selectLikeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							int mno, Model model) {
		int listCount = myService.selectLikeListCount(mno);
		MypagePageInfo mypi = MypagePagination.getMypagePageInfo(listCount, currentPage, 5, 6);
		
		List<Object> list = myService.selectLikeList(mno,mypi);
		model.addAttribute("mypi", mypi);
		model.addAttribute("list", list);
		
		return "mypage/mypageLikeProject";
	}
	
	// 제작한 프로젝트
	@RequestMapping("myMadeProject.me")
	public String mypageMadeProject() {
		return "mypage/mypageMadeProject";
	}
	
	// 메세지 페이지
		@RequestMapping("mypageMessage.me")
		public String mypageMessage() {
			return "mypage/mypageMessage";
		}
	
	// 프로젝트 만들기
	@RequestMapping("makeProject.me")
	public String makeProjectPage() {
		return "mypage/mypageMakeProject";
	}
	
	// 설정-계정
	@RequestMapping("optionAccount.me")
	public String optionAccount() {
		return "mypage/optionAccount";
	}
	
	// 설정-결제수단
	@RequestMapping("optionPay.me")
	public String optionPay() {
		return "mypage/optionPay";
	}
	
	// 설정-프로필
	@RequestMapping("optionProfile.me")
	public String optionProfile() {
		return "mypage/optionProfile";
	}
	
	// 설정-배송지등록
	@RequestMapping("optionShipping.me")
	public String optionShipping() {
		return "mypage/optionShipping";
	}
	
}