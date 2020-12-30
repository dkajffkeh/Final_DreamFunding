package com.donjomjo.dreamfunding.order.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;

public interface OrderService {

	ProjectInsert selectProject(int pno);

	Shipping selectShipping(int mno);

	ArrayList<MemberPurchase> selectMemberPurchaseList(int mno);

	String purchaseProcess(PurchaseInfo pi);

	Member selectMember(int mno);

	int insertPurchaseInfo(PurchaseInfo pi);

	Reward selectReward(int rewardNum);

}
