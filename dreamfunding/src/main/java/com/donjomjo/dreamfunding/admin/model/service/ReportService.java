package com.donjomjo.dreamfunding.admin.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.admin.model.vo.Report;
import com.donjomjo.dreamfunding.member.model.vo.Member;

public interface ReportService {
	
	public Report selectReport(int rno);
	
	public ArrayList<Report> selectReportList();
	
	public int projectBlind(int pno , int rno);
	
	public int reportProfreadDone(int rno);
	
	public ArrayList<Member> selectUsers();
	
	public int userBlack(int mno);
	
	public int userRecover(int mno);
	
}
