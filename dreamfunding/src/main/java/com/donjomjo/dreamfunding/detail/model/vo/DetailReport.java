package com.donjomjo.dreamfunding.detail.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class DetailReport {

		private int reportNo;
		private int projectNo;
		private String projectTitle;
		private int memberNo;
		private String reportContent;
		private String reportDate;
		private String reportStatus;
		
	}
