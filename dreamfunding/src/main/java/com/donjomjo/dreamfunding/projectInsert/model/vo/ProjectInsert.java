package com.donjomjo.dreamfunding.projectInsert.model.vo;

import lombok.Data;

@Data
public class ProjectInsert {

	private int projectNo;
	private String memberNo;
	private String proCategoryNo;
	private String projectGoal; //프로젝트 성공조건
	private String bankNo;
	private String projectTitle;
	private String projectSubtitle;
	private String projectGoalPrice;
	private String projectURL;
	private String projectStartDate;
	private String projectEndDate;
	private String projectThumbnailPath; //프로젝트 대표이미지 경로
	private String projectFileName; //프로젝트 대표이미지 파일 이름
	private String creatorThumbnailPath;
	private String creatorProfile;
	private String creatorName;
	private String creatorIntro;
	private String hashtag;
	private String projectVideoURL;  
	private String projectContent; //ckeditor
	private String projectReason;
	private int projectCount;
	private String projectRefundPolicy;
	private String creatorPhone;
	private String phoneCheck;
	private String creatorEmail;
	private String creatorBank;
	private String creatorAccount;
	private String accountHolder;
	private String webURL;
	private String insta;
	private String facebook;
	private String status; //프로젝트 상태
	private String createDate;
	private String projectTemp; //temp
	
}
