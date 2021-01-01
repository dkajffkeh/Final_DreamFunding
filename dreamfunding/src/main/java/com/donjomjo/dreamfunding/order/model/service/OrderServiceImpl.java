package com.donjomjo.dreamfunding.order.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.dao.OrderDao;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;

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

	@Override
	public String purchaseProcess(PurchaseInfo pi) {
		
		return (String) oDao.puchaseProcess(sqlSession, pi);
		
	}

	@Override
	public Member selectMember(int mno) {
		return oDao.selectMember(sqlSession, mno);
	}

	@Override
	public int insertPurchaseInfo(PurchaseInfo pi) {
		return oDao.insertPurchseInfo(sqlSession, pi);
	}

	@Override
	public Reward selectReward(int reno) {
		return oDao.selectReward(sqlSession, reno);
	}

	
}
