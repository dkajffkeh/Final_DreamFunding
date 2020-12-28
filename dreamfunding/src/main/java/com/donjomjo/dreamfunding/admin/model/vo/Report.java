package com.donjomjo.dreamfunding.admin.model.vo;

import lombok.Data;

@Data
public class Report {

	private int reportNo;
	private int projectNo;
	private int memberNo;
	private String reportContent;
	private String reportDate;
	private String reportStatus;
	
}
