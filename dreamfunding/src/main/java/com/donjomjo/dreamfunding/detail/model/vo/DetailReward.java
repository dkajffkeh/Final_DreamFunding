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
public class DetailReward {

	private int rewardNo; // 리워드 식별자
	private int projectNo; // 프로젝트 식별자
	private String rewardPrice; // 리워드 금액
	private String rewardStatus; // 리워드 상태(Y제한 N무제한)
	private int rewardNumber; // 제공가능수
	private String rewardShCheck; // 배송지 필요여부
	private int saleCount; // 판매갯수
	private ArrayList<DetailReward> detailRewardList;
	private ArrayList<DetailRewardOpt> detailRewardOptList;
}
