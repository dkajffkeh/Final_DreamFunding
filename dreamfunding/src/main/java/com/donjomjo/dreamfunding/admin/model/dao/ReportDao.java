package com.donjomjo.dreamfunding.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.admin.model.vo.Report;
import com.donjomjo.dreamfunding.member.model.vo.Member;

@Repository
public class ReportDao {

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList");
	}

	public Report selectReport(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("reportMapper.selectReport",rno);
	}

	public int projectBlind(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.update("reportMapper.projectBlind", pno);
	}

	public int rewardStatusUpdate(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("reportMapper.rewardStatusUpdate",rno);
		
	}

	public int reportProfreadDone(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("reportMapper.reportProfreadDone",rno);
	}

	public ArrayList<Member> selectUsers(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectUsers");
	}

	public int userBlack(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("reportMapper.userBlack",mno);
	}

	public int userRecover(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.update("reportMapper.userRecover",mno);
	}

}
