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
public class Shipping {

	private int shippingNo;
	private int memberNo;
	private int shippingZipcode;
	private String shippingDAddr;
	private String shippingSAddr;
	private String receieverName;
	private String receieverPhone;
	private String shippingBasic;
	
	
}
