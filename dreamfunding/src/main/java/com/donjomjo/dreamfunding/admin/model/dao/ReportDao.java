package com.donjomjo.dreamfunding.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.admin.model.vo.Report;

@Repository
public class ReportDao {

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession) {
		
		return null;
	}

}
