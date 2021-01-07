package com.donjomjo.dreamfunding.index.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.index.model.vo.Index;
import com.donjomjo.dreamfunding.index.model.vo.Like;

@Repository
public class IndexDao {
	
	// 진행중인 펀딩리스트 조회
	public ArrayList<Index> selectProgressFundingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectProgressFundingList");
	}
	// 실시간 랭킹 리스트 조회
	public ArrayList<Index> selectRankingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectRankingList");
	}
	// 종료된 펀딩리스트 조회
	public ArrayList<Index> selectClosedFundingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectClosedFundingList");
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectFundingMoney(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectFundingMoneyList"); 
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectClosed(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectClosedList"); 
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectNew(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectNewList"); 
	}

	public int increaseLike(SqlSessionTemplate sqlSession, Like like) {
	
		return sqlSession.insert("indexMapper.increaseLike", like);
	}
	
	public int likeYN(SqlSessionTemplate sqlSession, Like like) {
		int likeYN = sqlSession.selectOne("indexMapper.likeYN", like);
		
		return likeYN;
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.delete("indexMapper.deleteLike", like);
	}
	
	public ArrayList<Like> likeList(SqlSessionTemplate sqlSession, int mno){
		return (ArrayList)sqlSession.selectList("indexMapper.likeList", mno);
	}
}
