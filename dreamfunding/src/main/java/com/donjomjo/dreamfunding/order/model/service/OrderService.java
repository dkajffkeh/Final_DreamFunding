package com.donjomjo.dreamfunding.order.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

public interface OrderService {

	ProjectInsert selectProject(int pno);

	Shipping selectShipping(int mno);

	ArrayList<MemberPurchase> selectMemberPurchaseList(int mno);

}
