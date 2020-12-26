package com.donjomjo.dreamfunding.projectInsert.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RewardOption {

	private int optionNo;
	private int rewardNo;
	private String rewardContent;
	private ArrayList<RewardOption> optionList;
	
}
