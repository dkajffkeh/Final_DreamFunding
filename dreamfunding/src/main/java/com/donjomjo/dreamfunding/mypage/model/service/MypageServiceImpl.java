package com.donjomjo.dreamfunding.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.dao.MypageDao;
import com.donjomjo.dreamfunding.mypage.model.vo.FundingProject;
import com.donjomjo.dreamfunding.mypage.model.vo.FundingProjectDetail;
import com.donjomjo.dreamfunding.mypage.model.vo.LikeProject;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MypageDao myDao;
   // 펀딩 프로젝트 리스트 갯수
	@Override
	public int selectFundingListCount(int mno) {
		return myDao.selectFundingListCount(sqlSession, mno);
	}
//펀딩 프로젝트 리스트 조회
	@Override
	public List<Object> selectFundingList(int mno, MypagePageInfo mypi) {
		return myDao.selectFundingList(sqlSession, mno, mypi);
	}

	@Override
	public FundingProjectDetail selectFundingProjectDetail(int pno) {
		
		return null;
	}

	@Override
	public int deleteFundingProject(int pno) {
		
		return 0;
	}

	@Override
	public int selectLikeListCount(int mno) {
		
		return myDao.selectLikeListCount(sqlSession, mno);
	}

	@Override
	public List<Object> selectLikeList(int mno, MypagePageInfo mypi) {
		
		return myDao.selectLikeList(sqlSession, mno, mypi);
	}

	@Override
	public int deleteLikeProject(int pno) {
		
		return 0;
	}
	
	

	

	
	

}
