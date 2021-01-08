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
public class LikeProject {
	
	private int projectNo;
	private String projectThumbnailPath;
	private String projectFileName;
	private String projectTitle;
	private String projectSubTitle;
    private String projectGoalPrice;
	private String projectGoal;
	private String projectCloseDate;
	private String creatorStatus;

}
