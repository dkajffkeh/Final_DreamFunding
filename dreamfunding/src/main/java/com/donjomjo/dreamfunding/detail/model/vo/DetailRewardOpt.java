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
public class DetailRewardOpt {

	private int optionNo; // 옵션 식별자
	private int rewardNo; // 리워드 식별자
	private String rewardContent; // 옵션내용 
	
	
}
