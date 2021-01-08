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
public class Reply {

	private int replyNo; // 댓글식별자
	private int memberNo; // 회원번호 식별자
	private int projectNo; // 프로젝트 식별자
	private String replyContent; // 댓글내용
	private String replyDate; // 댓글 작성일
	private String replyStatus; // 댓글 상태 
	private ArrayList<SubReply> subReply;
	private String memberSystemName;
	private String memberNickname;
	
}
