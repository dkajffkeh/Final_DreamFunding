package com.donjomjo.dreamfunding.order.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

public interface OrderService {

	ProjectInsert selectProject(int pno);

	Shipping selectShipping(int mno);

	ArrayList<MemberPurchase> selectMemberPurchaseList(int mno);

	String purchaseProcess(PurchaseInfo pi);

	Member selectMember(int mno);

	int insertPurchaseInfo(PurchaseInfo pi);

	Reward selectReward(int rewardNum);

	ArrayList<RewardOption> selectRewardOption(int rewardNum);

	PurchaseInfo selectPurchaseInfo(PurchaseInfo pi);

	PurchaseInfo selectPurchaseInfo(int pno);

	ProjectCategory selectProjectCate(int proCategoryNo);

	ArrayList<ProjectInsert> selectProjectList();

	ArrayList<PurchaseInfo> selectOrderList();

	PurchaseInfo selectCancelId(int oNo);

	int updateOrder(int oNo);

	PurchaseInfo selectCancelOrder(int oNo);

}
