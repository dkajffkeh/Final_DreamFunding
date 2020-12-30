package com.donjomjo.dreamfunding.index.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.index.model.dao.IndexDao;
import com.donjomjo.dreamfunding.index.model.vo.Index;

@Service
public class IndexServiceImpl implements IndexService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private IndexDao iDao;
	
	
	// 진행중인 펀딩리스트 조회 서비스
	@Override
	public ArrayList<Index> selectProgressFundingList() {
		
		return iDao.selectProgressFundingList(sqlSession);
		
	}
	
	// 랭킹 리스트 조회 서비스
	@Override
	public ArrayList<Index> selectRankingList() {
		return iDao.selectRankingList(sqlSession);
	}

	// 종료된 펀딩리스트 조회 서비스
	@Override
	public ArrayList<Index> selectClosedFundingList() {
		return iDao.selectClosedFundingList(sqlSession);
	}

	@Override
	public int increaseCount(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Index selectDetailProject() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	

}
