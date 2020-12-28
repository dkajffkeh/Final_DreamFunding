package com.donjomjo.dreamfunding.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

@Repository
public class OrderDao {

	public ProjectInsert selectProject(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("orderMapper.selectProject", pno);
	}

	public Shipping selectShipping(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("orderMapper.selectShipping", mno);
	}

	public ArrayList<MemberPurchase> selectMemberPurchaseList(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectMemberPurchaseList", mno);
	}

}
