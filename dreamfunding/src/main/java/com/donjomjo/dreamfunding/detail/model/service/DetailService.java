package com.donjomjo.dreamfunding.detail.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.detail.model.vo.DetailPageInfo;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReport;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReward;
import com.donjomjo.dreamfunding.detail.model.vo.DetailRewardOpt;
import com.donjomjo.dreamfunding.detail.model.vo.Like;
import com.donjomjo.dreamfunding.detail.model.vo.Reply;
import com.donjomjo.dreamfunding.detail.model.vo.SubReply;

public interface DetailService {
	
	// 리스트 조회용 서비스 
	int selectListCount(); // 게시글 총 갯수 
	
	ArrayList<Detail> selectDetailList(DetailPageInfo pi); 
	
	// projectNo으로 프로젝트 조회수 증가 서비스 
	int increaseDetailCount(int pno);
	
	// 프로젝트 번호로 상세 조회 서비스 
	Detail selectDetailAll(int pno);
	
	// 현재 프로젝트에 연결된 리워드 조회 서비스 
	ArrayList<DetailReward> selectDetailReward(int pno);
	
	// 프로젝트 신고 등록 서비스
	int insertReport(DetailReport rp);
	
	//프로젝트 좋아요 등록 서비스
	int insertLike(Like lk);

	// 좋아요 조회 서비스 
	int selectLike(Like lk);
	
	// 좋아요 취소 서비스 
	int deleteLike(Like lk);
	

	
	// 댓글 등록 서비스 
	int insertReply(Reply reply);
	
	// 댓글 조회 서비스
	ArrayList<Reply> selectReply(int pno);
	
	// 댓글 수정 서비스 
	int updateReply(Reply reply);
	
	// 댓글 삭제 서비스
	int deleteReply(int reno);
	
	
	// 대댓글 등록 서비스  
	int insertSubReply(SubReply subReply);
	
	// 대댓글 조회 서비스
	ArrayList<SubReply> selectSubReply(int rno);
	
	// 대댓글 수정 서비스 
	int updateSubReply(SubReply subReply);
	
	// 대댓글 삭제 서비스
	int deleteSubReply(int subNo);

	




}
