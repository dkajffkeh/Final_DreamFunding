package com.donjomjo.dreamfunding.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
public class Member {

	private int memNo;
	private String email;
	private String memPwd;
	private String memNick;
	private String memName;
	private String phone;
	private Date memCreate;
	private String gender;
	private String memPfPath;
	private String memSystemname;
	private String memStatus;
	private String memLink;
	private String refresToken;
	private String accessToken;
	private String status;
	
	

}
