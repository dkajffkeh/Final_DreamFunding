package com.donjomjo.dreamfunding.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.admin.model.dao.ReportDao;
import com.donjomjo.dreamfunding.admin.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReportDao rDao;

	@Override
	public Report selectReport(int rno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Report> selectReportList() {
		
		return rDao.selectReportList(sqlSession);
	}

}
