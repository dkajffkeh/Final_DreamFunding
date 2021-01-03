package com.donjomjo.dreamfunding.mypage.model.vo;

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
public class FundingProject {
	
	private int projectNo;
	private String projectThumbnailPath;
	private String projectFileName;
	private String projectTitle;
	private String projectStartDate;
    private String projectCloseDate;
	private String creatorStatus;
	
}
