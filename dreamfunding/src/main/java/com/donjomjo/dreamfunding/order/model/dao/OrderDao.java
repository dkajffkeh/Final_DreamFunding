package com.donjomjo.dreamfunding.order.model.dao;

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
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;

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

	public Object puchaseProcess(SqlSessionTemplate sqlSession, PurchaseInfo pi) {

		return null;
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("orderMapper.selectMemer", mno);
	}

	public int insertPurchseInfo(SqlSessionTemplate sqlSession, PurchaseInfo pi) {
		return sqlSession.insert("orderMapeer.insertPurchaseInsert", pi);
	}

	public Reward selectReward(SqlSessionTemplate sqlSession, int reno) {
		return null;
	}

	
	
}
