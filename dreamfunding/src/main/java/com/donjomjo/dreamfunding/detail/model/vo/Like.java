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
public class Like {

	/*
	 * 프로젝트 식별자
	 * 회원번호 식별자 
	 */
	private int projectNo;
	private int memberNo;
	
}
