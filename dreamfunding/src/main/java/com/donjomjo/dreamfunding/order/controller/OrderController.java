package com.donjomjo.dreamfunding.order.controller;


import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.order.model.service.OrderService;
import com.donjomjo.dreamfunding.order.model.vo.MemberPurchase;
import com.donjomjo.dreamfunding.order.model.vo.PurchaseInfo;
import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

@Controller // 어노테이션을 붙여주면 빈 스캐닝을 통해 자동으로 빈으로 등록
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	
	
	
	@RequestMapping("orderTest.test")
	public String OrderTest() throws java.text.ParseException {	
		
		
		long test = unixTimeset(1);
		System.out.println(test);

		
		return "order/orderTest";
	}
	
	@RequestMapping("orderInsert.me")
	public String OrderInsertPage(int pno, int mno, int rewardNum, int rewardAmount, Model model) throws java.text.ParseException {
		
		ProjectInsert p = oService.selectProject(pno);
		Shipping s = oService.selectShipping(mno);	
		ArrayList<MemberPurchase> mp = oService.selectMemberPurchaseList(mno);
		Reward re = oService.selectReward(rewardNum);
		ArrayList<RewardOption> reOp = oService.selectRewardOption(rewardNum);
		
		System.out.println(reOp);
		
		int rewardPri = rewardAmount * Integer.parseInt(re.getRewardPrice());
		
		System.out.println(mp.get(0));
		
		model.addAttribute("mno", mno);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("mp", mp);
		model.addAttribute("rewardPri", rewardPri);
		model.addAttribute("rewardNum", rewardNum);
		model.addAttribute("rewardAmount", rewardAmount);
		model.addAttribute("reOp", reOp);
		model.addAttribute("re",re);
		
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
	
	@RequestMapping(value="/order.send", method= RequestMethod.POST, produces ="application/json; charset=UTF-8", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	  public String orderSend(PurchaseInfo pi, int mno, int pno, Model model) throws ParseException, java.text.ParseException {
		
				
		RestTemplate rest = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
	    headers.setContentType(MediaType.APPLICATION_JSON); 
	    HttpEntity<String> entity = null;

	    

		// parameter 세팅
		JSONObject obj = new JSONObject();
	      obj.put("imp_key","imp_apikey");
	      obj.put("imp_secret","ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
		
	    String gettoken = "";
	      
	    entity = new HttpEntity(obj.toJSONString(),headers);
	      
		//String getToken  =  rest.postForObject("https://api.iamport.kr/users/getToken", obj, String.class);
		String getToken  =  rest.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);

		
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
			String merchantUid = randomString("dreamFunding");
			
			// customer_uid 고객고유번호 생성
			String customerEmail = m.getEmail();
			String customerUid = randomString(customerEmail.substring(0,3));
			
			// 결제전용 날짜변환
			String payDate = pi.getPurchaseVYear() + pi.getPurchaseVMonth();
			
			// 결제날짜 계산
			long timeStamp = unixTimeset(pno);
			
			
			
			
		System.out.println(merchantUid);
		System.out.println(customerUid);

		
		
		pi.setPurchaseBkey(merchantUid);
		pi.setMemberNo(mno);
		
		if(pi.getPurinfoReq() == "") {
			pi.setPurinfoReq("요청사항 없음");
		}
		

			
		 	//스케쥴 예약 결제
		 	String schedule = "[{	 	 \"merchant_uid\": \" " + merchantUid 
								+ " \" , \"schedule_at\": \" " +  timeStamp
								+ " \" , \"amount\": \" " + pi.getTotalPrice()
								+ " \" , \"buyer_name\": \" " + pi.getReceieverName()
								+ " \" , \"buyer_tel\": \" " + pi.getReceieverPhone()
								+ " \" , \"buyer_addr\": \" " + pi.getShippingSAddr() + pi.getShippingDAddr()
								+ " \" , \"buyer_postcode\": \" " + pi.getShippingZipcode() +
							 " \"}]";	 	
			
	 
			//스케쥴 예약 결제
		 	JSONObject scheduling = new JSONObject();
		 		scheduling.put("merchant_uid", merchantUid);
		 		scheduling.put("schedule_at", timeStamp);
		 		scheduling.put("amount", pi.getTotalPrice());
		 		scheduling.put("buyer_name", pi.getReceieverName());
		 		scheduling.put("buyer_tel", pi.getReceieverPhone());
		 		scheduling.put("buyer_addr", pi.getShippingSAddr() + pi.getShippingDAddr());
		 		scheduling.put("buyer_postcode", pi.getShippingZipcode());

		 	
			//JSONObject scheduleObj = (JSONObject) jsonParser.parse(schedule);
		 	Object sobj = jsonParser.parse(schedule);
		 	JSONArray scheduleObj = (JSONArray)sobj;
		 	
		 	/* 실제 사용 결제
		 	 JSONObject sendObj = new JSONObject();
		  		sendObj.put("customer_uid", customerUid);
				sendObj.put("checking_amount", 100);
				sendObj.put("card_number", pi.getPurchaseCNumber);
				sendObj.put("expiry", payDate);
				sendObj.put("birth", pi.getPurchaseCDate());
				sendObj.put("pwd_2digit", pi.getPurchaseCPwd());
				sendObj.put("schedules", scheduleObj);
		 	 */
		 	
		 	JSONObject sendObj = new JSONObject();
		  		sendObj.put("customer_uid", customerUid);
				sendObj.put("checking_amount", 100);
				sendObj.put("card_number", "5171-3400-0214-4212");
				sendObj.put("expiry", payDate);
				sendObj.put("birth", pi.getPurchaseCDate());
				sendObj.put("pwd_2digit", pi.getPurchaseCPwd());
				sendObj.put("schedules", scheduleObj);

	    headers.add("Authorization", _token);
		headers.set("Authorization", _token);
		
	    entity = new HttpEntity(sendObj.toJSONString(),headers); 
		
		//String getResult = rest.postForObject("https://api.iamport.kr/subscribe/payments/schedule", sendObj, String.class);  
		String getResult = rest.postForObject("https://api.iamport.kr/subscribe/payments/schedule", entity, String.class);

		System.out.println(getResult);
		
		JSONObject resultObj = (JSONObject) jsonParser.parse(getResult);

		PurchaseInfo pNo = null;
		int pResult =0;
		int cResult = 0;
		if((Long)resultObj.get("code")  == 0){

			JSONArray rObj = (JSONArray) resultObj.get("response"); // response는 어레이이라서 따로 가져와야한다.
			//JSONObject resObj = new JSONObject();
			//String resObjStr = rObj.toJSONString();
			//resObj = (JSONObject) jsonParser.parse(resObjStr);
			//System.out.println("imp_uid==>>"+ resObj.get("imp_uid") );
			//System.out.println("imp_uid==>>"+ rObj.get("imp_uid") );
			//String rImp_id = (String) rObj.get("imp_uid");
			
			String bkey = merchantUid + "-" + customerUid;  // 1번째 가맹점 주문번호, 2번째 고객번호, 3번째 거래발급번호
			pi.setPurchaseBkey(bkey);
		
			
			System.out.println(pi);
			
			cResult = 1;
			pResult = oService.insertPurchaseInfo(pi);
			pNo = oService.selectPurchaseInfo(pi);

		}else {
			
			System.out.println("message==>>"+ resultObj.get("message") );			
			
			cResult = 0;
			pResult = 0;
		}
		
		
		
		pi.setMemberNo(mno);
				
		if(pResult * cResult > 0) {
			return "redirect:order.com?pno=" + pNo.getPurinfoNo();
		} else {
			model.addAttribute("errorMsg", resultObj.get("message") + "결제실패");
			return "common/errorPage";
		}

		
	  }
	
	/*
	// 일반 결제
	JSONObject sendObj = new JSONObject();
		sendObj.put("merchant_uid", merchant_uid);
		sendObj.put("amount", "");
		sendObj.put("card_number", "5171-3400-0214-4212");
		sendObj.put("expiry", payDate);
		sendObj.put("birth", pi.getPurchaseCDate());
		sendObj.put("pwd_2digit", pi.getPurchaseCPwd());
		sendObj.put("customer_uid", "45464887fdg");
		sendObj.put("name", "테스트");
	*/
	
	@RequestMapping("order.com")
	public String orderComplete (int pno, Model model){
		
		PurchaseInfo pi = oService.selectPurchaseInfo(pno);
		ArrayList<RewardOption> reOp = oService.selectRewardOption(pi.getReNo());
		Reward re = oService.selectReward(pi.getReNo());
		ProjectInsert pro = oService.selectProject(re.getProjectNo());
		ProjectCategory proc = oService.selectProjectCate(Integer.parseInt(pro.getProCategoryNo()));
		ArrayList<ProjectInsert> proList = oService.selectProjectList();
		
		
		model.addAttribute("re", re);
		model.addAttribute("reOp", reOp);
		model.addAttribute("pro", pro);
		model.addAttribute("pi", pi);
		model.addAttribute("proc", proc);
		model.addAttribute("proList", proList);
		
		return "order/orderCompletePage";
		
	}
	
	@RequestMapping("orderAdmin.com")
	public String orderAdmin(Model model) {
		
		ArrayList<PurchaseInfo> orderList = oService.selectOrderList(); 
		System.out.println(orderList);
		
		model.addAttribute("orderList", orderList);
		
		return "order/orderAdmin";
		
	}
	
	@RequestMapping("orderCancel.co")
	public String orderCanceled(int pno, Model modle) {
		
		PurchaseInfo pi = 
		
		
		return "";
	}
	
		
	  private long unixTimeset(int pno) throws java.text.ParseException {
		  
		  ProjectInsert pi = oService.selectProject(pno);
		  String oTime = pi.getProjectEndDate();
		  oTime += " 00:00:00";
		  
		  System.out.println(oTime);
		  
		  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  Date date = format.parse(oTime);
		  long currentTime = date.getTime()/1000;
		   
		return currentTime;
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
