package com.donjomjo.dreamfunding.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.order.model.service.OrderService;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

@Controller // 어노테이션을 붙여주면 빈 스캐닝을 통해 자동으로 빈으로 등록
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@RequestMapping("orderTest.test")
	public String OrderTest() {	
		return "order/orderTest";
	}
	
	@RequestMapping("orderInsert.me")
	public String OrderInsertPage(int pno, int mno, String content, int rewardNum, int rewardPrice, Model model) {
		
		ProjectInsert p = oService.selectProject(pno);
		Shipping s = oService.selectShipping(mno);	
		ArrayList<MemberPurchase> mp = oService.selectMemberPurchaseList(mno);
		
		int rewardPri = rewardNum * rewardPrice;
		
		System.out.println(mp);
		
		model.addAttribute("content", content);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("mp", mp);
		model.addAttribute("rewardPri", rewardPri);
		
		return "order/orderInsertPage";
	}
	

}
