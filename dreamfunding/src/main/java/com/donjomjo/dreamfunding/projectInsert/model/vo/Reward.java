package com.donjomjo.dreamfunding.projectInsert.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Reward {
	
	private int rewardNo;
	private int projectNo;
	private String rewardPrice;
	private String rewardStatus;
	private int rewardNumber;
	private String rewardShCheck;
	private int saleCount;
	private int rewardAmount; //리워드 1번 배열에 리워드 갯수가 몇개가 들어있는지.
	private ArrayList<Reward> rewardList;
	
	
	
}
