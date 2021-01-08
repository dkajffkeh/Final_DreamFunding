package com.donjomjo.dreamfunding.mypage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.vo.FundingProject;
import com.donjomjo.dreamfunding.mypage.model.vo.LikeProject;

@Repository
public class MypageDao {


	//펀딩한 프로젝트 리스트 갯수
	public int selectFundingListCount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("mypageMapper.selectFundingListCount", mno);
	}
	// 펀딩한 프로젝트 리스트 조회
	public List<Object> selectFundingList(SqlSessionTemplate sqlSession, int mno, MypagePageInfo mypi){
		int offset = (mypi.getCurrentPage()-1) * mypi.getMypageLimit();
		RowBounds rowBounds = new RowBounds (offset, mypi.getMypageLimit());
	
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFundingList", mno, rowBounds);
	}
	
	
		
	
	//관심있는 프로젝트 리스트 갯수
	public int selectLikeListCount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("mypageMapper.selectLikeListCount", mno);
	}
	
	//관심있는 프로젝트 리스트 조회
	public List<Object> selectLikeList(SqlSessionTemplate sqlSession, int mno, MypagePageInfo mypi){
		int offset = (mypi.getCurrentPage()-1) * mypi.getMypageLimit();
		RowBounds rowBounds = new RowBounds (offset, mypi.getMypageLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectLikeList", mno, rowBounds);
	}
	
}
