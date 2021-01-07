package com.donjomjo.dreamfunding.index.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.index.model.vo.Index;
import com.donjomjo.dreamfunding.index.model.vo.Like;

public interface IndexService {
	
	
	// 1. 진행중인 펀딩 조회용 서비스
	ArrayList<Index> selectProgressFundingList();
	
	// 2. 실시간 랭킹 조회용 서비스
	ArrayList<Index> selectRankingList();
	
	// 3. 종료된 펀딩 조회용 서비스
	ArrayList<Index> selectClosedFundingList();
	
	// 4. 프로젝트 상세조회용 서비스
	int increaseCount(int projectNo);
	Index selectDetailProject();
	
	// 5. 실시간 문의하기 채팅 서비스
	
	// 6. 실시간 알림 서비스
	
	// 7. 최근검색어 서비스
	
	// 8. 진행중인 펀딩(펀딩금액순) 조회
	ArrayList<Index> selectFundingMoney();
	
	// 8. 진행중인 펀딩(마감임박순) 조회
	ArrayList<Index> selectClosed();

	// 8. 진행중인 펀딩(최신순) 조회
	ArrayList<Index> selectNew();
	
	int increaseLike(Like like);
	
	int likeYN(Like like);
	
	int deleteLike(Like like);
	
	ArrayList<Like> likeList(int mno);
	
	

}
