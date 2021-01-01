package com.donjomjo.dreamfunding.admin.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.admin.model.vo.Report;

public interface ReportService {
	
	public Report selectReport(int rno);
	
	public ArrayList<Report> selectReportList();
	
	public int projectBlind(int pno , int rno);
	
	public int reportProfreadDone(int rno);

}
