package com.donjomjo.dreamfunding.serviceCenter.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Council {
	
	private int councilNo;
	private String councilTitle;
	private int memberNo;
	private String councilContent;
	private String councilCdate;
	private String councilAns;
	private String councilStatus;
	private int councilCate;
	private String councilAdate;
	private String memberName;

}
