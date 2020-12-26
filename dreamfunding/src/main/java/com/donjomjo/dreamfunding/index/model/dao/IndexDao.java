package com.donjomjo.dreamfunding.index.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.index.model.vo.Index;

@Repository
public class IndexDao {
	
	
	public ArrayList<Index> selectProgressFundingList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectProgressFundingList");
		
		
	}

}
