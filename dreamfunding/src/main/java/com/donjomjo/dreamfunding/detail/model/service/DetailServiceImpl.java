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
	public int insertLike(Like lk) {
		return dDao.insertLike(sqlSession, lk);
	}

	@Override
	public int selectLike(Like lk) {
		return dDao.selectLike(sqlSession, lk);
	}

	@Override
	public int deleteLike(Like lk) {
		return dDao.deleteLike(sqlSession, lk);
	}

	
	@Override
	public ArrayList<Reply> selectReply(int pno) {
		return dDao.selectReply(sqlSession, pno);
	}

	@Override
	public int insertReply(Reply rp) {
		return dDao.insertReply(sqlSession, rp);
	}
	
	@Override
	public int updateReply(Reply rp) {
		return dDao.updateReply(sqlSession, rp);
	}

	@Override
	public int deleteReply(int rno) {
		return dDao.deleteReply(sqlSession, rno);
	}

	
	@Override
	public ArrayList<SubReply> selectSubReply(int rno) {
		return dDao.selectSubReply(sqlSession, rno);
	}

	@Override
	public int insertSubReply(Reply rp) {
		return dDao.insertSubReply(sqlSession, rp);
	}

	@Override
	public int updateSubReply(Reply rp) {
		return dDao.updateSubReply(sqlSession, rp);
	}

	@Override
	public int deleteSubReply(int sno) {
		return dDao.deleteSubReply(sqlSession, sno);
	}

	@Override
	public ArrayList<SubReply> selectSubReplyOne(Reply rp) {
		return dDao.selectSubReplyOne(sqlSession, rp);
	}


	
	
}
