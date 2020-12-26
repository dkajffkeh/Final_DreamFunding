package com.donjomjo.dreamfunding.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.order.model.dao.OrderDao;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private OrderDao oDao;

	@Override
	public ProjectInsert selectProject(int pno) {
		return oDao.selectProject(sqlSession, pno);
	}

	@Override
	public Shipping selectShipping(int mno) {
		return oDao.selectShipping(sqlSession, mno);
	}

	@Override
	public ArrayList<MemberPurchase> selectMemberPurchaseList(int mno) {
		return oDao.selectMemberPurchaseList(sqlSession, mno);
	}

	
	
}
