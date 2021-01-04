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
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

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
		return sqlSession.selectOne("orderMapper.selectMember", mno);
	}

	public int insertPurchseInfo(SqlSessionTemplate sqlSession, PurchaseInfo pi) {
		return sqlSession.insert("orderMapper.insertPurchaseInsert", pi);
	}

	public Reward selectReward(SqlSessionTemplate sqlSession, int reno) {
		return sqlSession.selectOne("orderMapper.selectReward", reno);
	}

	public ArrayList<RewardOption> selectRewardOption(SqlSessionTemplate sqlSession, int reno) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectRewardOption",reno);
	}

	public PurchaseInfo selectPurchaseInfo(SqlSessionTemplate sqlSession, PurchaseInfo pi) {
		return sqlSession.selectOne("orderMapper.selectPurchaseInfo1", pi);
	}

	public PurchaseInfo selectPurchaseInfo(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("orderMapper.selectPurchaseInfo2", pno);
	}

	public ProjectCategory selectProjectCate(SqlSessionTemplate sqlSession, int pcno) {
		return sqlSession.selectOne("orderMapper.selectProjectCate", pcno);
	}

	public ArrayList<ProjectInsert> selectProjectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectProjectList");
	}

	public ArrayList<PurchaseInfo> selectOrderList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList");
	}

	public PurchaseInfo selectCanceldId(SqlSessionTemplate sqlSession, int oNo) {
		return sqlSession.selectOne("orderMapper.selectCancelId", oNo);
	}

	public int updateOrder(SqlSessionTemplate sqlSession, int oNo) {
		return sqlSession.update("orderMapper.updateOrder", oNo);
	}

	public PurchaseInfo selectCancelOrder(SqlSessionTemplate sqlSession, int oNo) {
		return sqlSession.selectOne("orderMapper.selectCancelOrder",oNo);
	}
	
	

	
	
}
