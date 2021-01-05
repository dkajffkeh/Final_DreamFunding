package com.donjomjo.dreamfunding.detail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.detail.model.dao.DetailDao;
import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.detail.model.vo.DetailPageInfo;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReport;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReward;
import com.donjomjo.dreamfunding.detail.model.vo.DetailRewardOpt;
import com.donjomjo.dreamfunding.detail.model.vo.Like;
import com.donjomjo.dreamfunding.detail.model.vo.Reply;
import com.donjomjo.dreamfunding.detail.model.vo.SubReply;

@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DetailDao dDao;
	
	
	@Override
	public int selectListCount() {
		return dDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Detail> selectDetailList(DetailPageInfo pi) {
		return dDao.selectDetailList(sqlSession, pi);
	}
	
	@Override
	public int increaseDetailCount(int pno) {
		return dDao.increaseDetailCount(sqlSession, pno);
	}

	@Override
	public Detail selectDetailAll(int pno) {
		return dDao.selectDetailAll(sqlSession, pno);
	}

	@Override
	public ArrayList<DetailReward> selectDetailReward(int pno) {
		return dDao.selectDetailReward(sqlSession, pno);
	}
	

	@Override
	public int insertReport(DetailReport rp) {
		return dDao.insertReport(sqlSession, rp);
	}

	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Like selectLike(Like like) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReply(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int reno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSubReply(SubReply subReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SubReply> selectSubReply(ArrayList<Reply> reList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSubReply(SubReply subReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSubReply(int subNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
}
