package com.donjomjo.dreamfunding.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.admin.model.vo.Report;

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

}
