package com.donjomjo.dreamfunding.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class PurchaseInfo {

	private int purinfoNo;
	private int memberNo;
	private int reNo;
	private int rewardAmount;
	private int rewardPlus;
	private String purinfoStatus;
	private String deliveryStatus;
	private String shippingZipcode;
	private String shippingSAddr;
	private String shippingDAddr;
	private String receieverName;
	private String receieverPhone;
	private String purinfoReq;
	private String purchaseCNumber;
	private String purchaseVYear;
	private String purchaseVMonth;
	private String purchaseCPwd;
	private String purchaseCDate;
	private String purchaseBkey;
	private String purchaseEmail;
	private int totalPrice; // db에 저장안되는 총합가격
	private String projectTitle; // db에 저장되지 않는 프로젝트 이름
	private int rewardPrice; // db에 저장되지 않는 리워드 가격
	private String projectCloseDt; // db에 저장되지 않는 프로젝트 이름

	
}
