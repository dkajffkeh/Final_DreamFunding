package com.donjomjo.dreamfunding.mypage.model.service;


import java.util.ArrayList;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.vo.Funding;

public interface MypageService {
	
	/* 
	 * 펀딩한 프로젝트
	 */

	// 1. 펀딩한 프로젝트 리스트 조회용 서비스
	
	int selectFundingListCount();
	ArrayList<Funding> selectFundingList(MypagePageInfo mypi);
	
	// 2. 펀딩한 프로젝트 상세조회용 서비스
	int myFundingIncreaseCount(int pno);
	Funding selectFunding(int pno);
	
	/*
	 * 관심있는 프로젝트
	 */
	
	/*
	 * 제작한 프로젝트
	 */
	
	/*
	 * 프로젝트 만들기
	 */
	

}
