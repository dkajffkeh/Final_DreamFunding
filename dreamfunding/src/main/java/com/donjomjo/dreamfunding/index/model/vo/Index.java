package com.donjomjo.dreamfunding.index.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter @ToString
public class Index {
	
	private int projectNo;				// 프로젝트 식별자
	private int memberNo;				// 회원번호 식별자
	private String proCateNo;			// 프로젝트 카테고리 식별자
	private String projectGoal;			// Y:100% 일때 완료 , N:조건없음
	private String projectTitle;		// 프로젝트 제목
	private String projectSubTitle;		// 프로젝트 서브제목
	private int projectGprice;			// 목표금액
	private String projectStartDt;		// 프로젝트 시작일
	private String projectCloseDt;		// 프로젝트 마감일
	private String projectUrl;			// 프로젝트 url
	private String projectThumPath;		// 프로젝트 썸네일 패스
	private String projectFileName;		// 프로젝트 썸네일 파일 이름
	private int projectCount;			// 프로젝트 조회수
	private String creatorName;			// 크리에이터 이름
	private String hashtag;				// 해쉬태그
	private Date projectCrDate;			// 프로젝트 생성일
	
	
}
