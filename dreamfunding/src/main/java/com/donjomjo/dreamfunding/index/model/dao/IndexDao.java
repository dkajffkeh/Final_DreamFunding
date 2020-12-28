package com.donjomjo.dreamfunding.index.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.index.model.vo.Index;

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
	

}
