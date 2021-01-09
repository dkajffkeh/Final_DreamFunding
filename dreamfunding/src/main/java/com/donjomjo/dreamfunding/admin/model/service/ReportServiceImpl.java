package com.donjomjo.dreamfunding.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.admin.model.dao.ReportDao;
import com.donjomjo.dreamfunding.admin.model.vo.Report;
import com.donjomjo.dreamfunding.member.model.vo.Member;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReportDao rDao;

	@Override
	public Report selectReport(int rno) {
		// TODO Auto-generated method stub
		return rDao.selectReport(sqlSession,rno);
	}

	@Override
	public ArrayList<Report> selectReportList() {
		
		return rDao.selectReportList(sqlSession);
	}

	@Override
	public int projectBlind(int pno ,int rno) {
	
		if ( rDao.projectBlind(sqlSession,pno)>0) {
			
			
			return rDao.rewardStatusUpdate(sqlSession,rno);
		}
		
		return 0;
	}

	@Override
	public int reportProfreadDone(int rno) {
		
		return rDao.reportProfreadDone(sqlSession,rno);
	}

	@Override
	public ArrayList<Member> selectUsers() {
		
		return rDao.selectUsers(sqlSession);
	}

	@Override
	public int userBlack(int mno) {
		
		return rDao.userBlack(sqlSession,mno);
	}

	@Override
	public int userRecover(int mno) {
		
		return rDao.userRecover(sqlSession,mno);
	}
	
	

}
