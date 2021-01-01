package com.donjomjo.dreamfunding.order.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.service.OrderService;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;

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
		Reward re = oService.selectReward(rewardNum);
		
		
		int rewardPri = rewardNum * rewardPrice;
		
		System.out.println(mp.get(0));
		
		model.addAttribute("content", content);
		model.addAttribute("mno", mno);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("mp", mp);
		model.addAttribute("rewardPri", rewardPri);
		model.addAttribute("rewardNum", rewardNum);
		model.addAttribute("rewardPrice", rewardPrice);
		
		for(int i=0; i< mp.size(); i++) {
			
			model.addAttribute("card" + i , mp.get(i));
			
		}
		
		return "order/orderInsertPage";
	}
	/*
	@RequestMapping(value="/hello3.no", method= RequestMethod.POST)
	  public void test3(@RequestBody String imp_key, String imp_secret, Model model) throws ParseException {
		
				
		RestTemplate rest = new RestTemplate();
		
		// parameter 세팅
		JSONObject obj = new JSONObject();
	      obj.put("imp_key","imp_apikey");
	      obj.put("imp_secret","ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
		
		String getToken  =  rest.postForObject("https://api.iamport.kr/users/getToken", obj, String.class);
		
		System.out.println(getToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(getToken);

		String _token = null;

		if((Long)jsonObj.get("code")  == 0){

			JSONObject Token = (JSONObject) jsonObj.get("response");

			System.out.println("Token==>>"+Token.get("access_token") );

			_token = (String)Token.get("access_token");

		}

		
		System.out.println(_token);
		
		JSONObject sendObj = new JSONObject();
			sendObj.put("merchant_uid", "ridkf123iferi");
			sendObj.put("amount", 1);
			sendObj.put("card_number", "5171-3400-0214-4212");
			sendObj.put("expiry", "2025-04");
			sendObj.put("birth", "971201");
			sendObj.put("pwd_2digit", "57");
			sendObj.put("customer_uid", "45464887fdg");
			sendObj.put("name", "테스트");


			
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", _token);
		headers.set("Authorization", _token);
		
		String getResult = rest.postForObject("https://api.iamport.kr/subscribe/payments/onetime?_token=" + _token  , sendObj, String.class);
		System.out.println(getResult);
		
		
	  }
	*/
	@RequestMapping(value="/order.send", method= RequestMethod.POST)
	  public String orderSend(@RequestBody PurchaseInfo pi, int mno, int pno, Model model) throws ParseException {
		
				
		RestTemplate rest = new RestTemplate();
		
		// parameter 세팅
		JSONObject obj = new JSONObject();
	      obj.put("imp_key","imp_apikey");
	      obj.put("imp_secret","ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
		
		String getToken  =  rest.postForObject("https://api.iamport.kr/users/getToken", obj, String.class);
		
		System.out.println(getToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(getToken);

		String _token = null;

		if((Long)jsonObj.get("code")  == 0){

			JSONObject Token = (JSONObject) jsonObj.get("response");

			System.out.println("Token==>>"+Token.get("access_token") );

			_token = (String)Token.get("access_token");

		}

		
		System.out.println(_token);
		System.out.println(pi);
		
		Member m = oService.selectMember(mno);
		
			
		
			// merchant_uid 거래고유번호 부여		
			String merchant_uid = randomString("dreamFunding");
			
			// customer_uid 고객고유번호 생성
			String customerEmail = m.getEmail();
			String customer_uid = randomString(customerEmail.substring(0,3));
			
			// 결제전용 날짜변환
			String payDate = pi.getPurchaseVYear() + pi.getPurchaseVMonth();
			
			
			
		System.out.println(merchant_uid);
		pi.setPurchaseBkey(merchant_uid);
		
		// 일반 결제
		JSONObject sendObj = new JSONObject();
			sendObj.put("merchant_uid", merchant_uid);
			sendObj.put("amount", pi.getTotalPrice());
			sendObj.put("card_number", "5171-3400-0214-4212");
			sendObj.put("expiry", payDate);
			sendObj.put("birth", pi.getPurchaseCDate());
			sendObj.put("pwd_2digit", pi.getPurchaseCPwd());
			sendObj.put("customer_uid", "45464887fdg");
			sendObj.put("name", "테스트");
		
		/*
		 	//스케쥴 예약 결제
		 	String schedule = "{	 \"merchant_uid\": " + merchant_uid 
								+ ", \"schedule_at\": " +  1478150985
								+ ", \"amount\": " + pi.getTotalPrice()
								+ ", \"buyer_name\": + pi.getReceieverName()
								+ ", \"buyer_tel\": + pi.getReceieverPhone()
								+ ", \"buyer_addr\": + pi.getShippingSAddr() + pi.getShippingDAddr()
								+ ", \"buyer_postcode\": " + pi.getShippingZipcode() +
							 " }";
							 
			Object scheduleObj = parser.parse(schedule);
							
		  	JSONObject sendObj = new JSONObject();
		  		sendObj.put("customer_uid", customer_uid);
				sendObj.put("merchant_uid", merchant_uid);
				sendObj.put("card_number", "5171-3400-0214-4212");
				sendObj.put("expiry", payDate);
				sendObj.put("birth", pi.getPurchaseCDate());
				sendObj.put("pwd_2digit", pi.getPurchaseCPwd());
		 
		 */
		
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    headers.add("Authorization", _token);
		headers.set("Authorization", _token);
		
		String getResult = rest.postForObject("https://api.iamport.kr/subscribe/payments/onetime?_token=" + _token  , sendObj, String.class);
		System.out.println(getResult);
		
		pi.setMemberNo(mno);
		
		int pResult = oService.insertPurchaseInfo(pi);
		
		if(pResult > 0) {
			return "order.com";
		} else {
			return "common/errorPage";
		}
		
		
		
	  }
	
	  // 거래고유번호, 고객번호 랜덤 생성
	  public String randomString(String str) {
		  
		  String result = str;
		  
		  Random rnd = new Random();
			String randNum = "";
			String randStr = "";
			for(int i=0; i<3; i++) {
				randNum += String.valueOf(rnd.nextInt(10));
				randStr += String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
			}
			Date date = new Date();
			String pattern = "yyyyMMddHHmmss";
			SimpleDateFormat f1 = new SimpleDateFormat(pattern);
			result += f1.format(date) + randNum + randStr; 
		  
		  return result;
	  }

}
