package com.donjomjo.dreamfunding.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.dao.MypageDao;
import com.donjomjo.dreamfunding.mypage.model.vo.Funding;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MypageDao myDao;
	
	//funding
	
	@Override
	public int selectFundingListCount() {
		return myDao.selectFundingListCount(sqlSession);
	}

	@Override
	public ArrayList<Funding> selectFundingList(MypagePageInfo mypi) {
		return myDao.selectFundingList(sqlSession, mypi);
	}

	@Override
	public int myFundingIncreaseCount(int pno) {
		return 0;
	}

	@Override
	public Funding selectFunding(int pno) {
		return null;
	}

	
	

}
