package com.donjomjo.dreamfunding.detail.model.vo;

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
public class SubReply {
	
	/*
	 	대댓글 식별자
		댓글 식별자
		회원번호 식별자
		대댓글 내용
		대댓글 작성일
		대댓글 상태 
	 */
	private int subReAnsNo;
	private int replyNo;
	private int memberNo;
	private String subReContent;
	private String subReDate;
	private String subReStatus; 
	private String memberPfPath;
	private String memberNickname;
}
