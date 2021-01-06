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
public class Faq {
	private int faqNo;
	private int memberNo;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;
	private int faqCate;
}
