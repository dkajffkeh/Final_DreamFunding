package com.donjomjo.dreamfunding.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.order.model.service.OrderService;
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
	public String OrderInsertPage(int pno, String content, int rewardNum, int rewardPrice, Model model) {
		
		ProjectInsert p = oService.selectProject(pno);
		
		int rewardPri = rewardNum * rewardPrice;
		
		
		model.addAttribute(content);
		model.addAttribute(p);
		model.addAttribute(rewardPri);

		
		return "order/orderInsertPage";
	}
	

}
