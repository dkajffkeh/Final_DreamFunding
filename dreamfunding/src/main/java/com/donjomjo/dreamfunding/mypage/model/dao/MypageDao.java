package com.donjomjo.dreamfunding.mypage.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;
import com.donjomjo.dreamfunding.mypage.model.vo.Funding;

@Repository
public class MypageDao {
	
	//funding 
	
	public int selectFundingListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.selectFundingListCount");
	}
	
	public ArrayList<Funding> selectFundingList(SqlSessionTemplate sqlSession, MypagePageInfo mypi){
		int offset=(mypi.getCurrentPage() -1)* mypi.getFundingLimit();
		RowBounds rowBounds = new RowBounds(offset, mypi.getFundingLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFundingList", null,rowBounds);
	}

}
