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
public class Notice {
	
	private int noticeNo;
	private int memberNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeUpload;
	private int noticeCount;
	private String noticeStatus;
	
}
