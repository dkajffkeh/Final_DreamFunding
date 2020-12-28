package com.donjomjo.dreamfunding.order.controller;


import java.io.IOException;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.donjomjo.dreamfunding.order.model.service.OrderService;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
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
		
		System.out.println(mp.get(0));
		
		model.addAttribute("content", content);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("mp", mp);
		model.addAttribute("rewardPri", rewardPri);
		
		for(int i=0; i< mp.size(); i++) {
			
			model.addAttribute("card" + i , mp.get(i));
			
		}
		
		return "order/orderInsertPage";
	}
	
	@RequestMapping("order.send")
	public void OrderInsert(PurchaseInfo pi, Model model) {
		
		System.out.println(pi);
		
		oService.purchaseProcess(pi);

	}
	
	@RequestMapping(value="/hello3.no", method= RequestMethod.POST)
	  public void test3(@RequestBody String imp_key, String imp_secret, Model model) throws IOException, ParseException {
		
				
		RestTemplate rest = new RestTemplate();
		
		JSONObject obj = new JSONObject();
	      obj.put("imp_key","imp_apikey");
	      obj.put("imp_secret","ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
		
		// parameter 세팅
	    MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
	    map.add(imp_key, imp_secret);
		String str =  rest.postForObject("https://api.iamport.kr/users/getToken", obj, String.class);
		
		System.out.println(str);
		
		
	  }

}
