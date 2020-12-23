package com.donjomjo.dreamfunding.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class MemberPurchase {

	private int purchaseNo;
	private int memberNo;
	private String purchaseCNumber;
	private String purchaseVYear;
	private String purchaseVMonth;
	private String purchaseCPwd;
	private String purchaseCDate;
	private String purchaseBKey;
	private String purchaseEmail;
	private String purchaseBasic;
	
}
