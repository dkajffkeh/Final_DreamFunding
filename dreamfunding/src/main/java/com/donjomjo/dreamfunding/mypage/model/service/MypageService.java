package com.donjomjo.dreamfunding.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.vo.FundingProject;
import com.donjomjo.dreamfunding.mypage.model.vo.FundingProjectDetail;
import com.donjomjo.dreamfunding.mypage.model.vo.LikeProject;

public interface MypageService {
	
	/* 
	 * 펀딩한 프로젝트 페이지------------------------------------------------------------------------------------------------------
	 */
	// 펀딩한 프로젝트 리스트 조회용 서비스
	int selectFundingListCount(int mno);
	List<Object> selectFundingList(int mno, MypagePageInfo mypi);
	// 펀딩한 프로젝트 상세조회용 서비스
	FundingProjectDetail selectFundingProjectDetail(int pno);
	// 펀딩한 프로젝트 리스트 삭제 서비스
	int deleteFundingProject(int pno);
	/*
	 * 관심있는 프로젝트------------------------------------------------------------------------------------------------------
	 */
	// 관심있는 프로젝트 리스트 조회용 서비스
	int selectLikeListCount(int mno);
	List<Object> selectLikeList(int mno, MypagePageInfo mypi);
	// 관심있는 프로젝트 리스트 삭제 서비스
	int deleteLikeProject(int pno);
	
	/*
	 * 제작한 프로젝트------------------------------------------------------------------------------------------------------
	 */
	
	/*
	 * 프로젝트 만들기------------------------------------------------------------------------------------------------------
	 */
	
	
	

}
