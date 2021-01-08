package com.donjomjo.dreamfunding.index.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.common.model.vo.PageInfo;
import com.donjomjo.dreamfunding.index.model.dao.IndexDao;
import com.donjomjo.dreamfunding.index.model.vo.Index;
import com.donjomjo.dreamfunding.index.model.vo.Like;

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

	@Override
	public ArrayList<Index> selectFundingMoney() {
		
		return iDao.selectFundingMoney(sqlSession);
	}

	@Override
	public ArrayList<Index> selectClosed() {
		return iDao.selectClosed(sqlSession);
	}

	@Override
	public ArrayList<Index> selectNew() {
		return iDao.selectNew(sqlSession);
	}

	@Override
	public int increaseLike(Like like) {
		return iDao.increaseLike(sqlSession, like);
	}

	@Override
	public int likeYN(Like like) {
		return iDao.likeYN(sqlSession, like);
	}

	@Override
	public int deleteLike(Like like) {
		return iDao.deleteLike(sqlSession, like);
	}

	@Override
	public ArrayList<Like> likeList(int mno) {
		return iDao.likeList(sqlSession, mno);
	}

	@Override
	public int selectListCount() {
		return iDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Index> selectProjectList(PageInfo pi) {
		return iDao.selectProjectList(sqlSession, pi);
	}

	@Override
	public ArrayList<Index> selectRankingList(PageInfo pi) {
		return iDao.selectRankingList(sqlSession, pi);
	}
	
	
	
	
	
	
	

}
