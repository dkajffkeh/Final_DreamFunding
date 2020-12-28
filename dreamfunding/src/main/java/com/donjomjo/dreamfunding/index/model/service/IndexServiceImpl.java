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
	
	
	
	@Override
	public ArrayList<Index> selectProgressFundingList() {
		
		return iDao.selectProgressFundingList(sqlSession);
		
	}

	@Override
	public ArrayList<Index> selectRankingList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Index> selectClosedFundingList() {
		// TODO Auto-generated method stub
		return null;
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
