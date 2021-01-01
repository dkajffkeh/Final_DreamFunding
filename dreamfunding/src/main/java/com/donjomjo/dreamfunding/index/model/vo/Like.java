package com.donjomjo.dreamfunding.index.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter @ToString
public class Like {
	
	private int projectNo;		// 프로젝트 식별자
	private int memberNo;		// 회원번호 시퀀스

}
