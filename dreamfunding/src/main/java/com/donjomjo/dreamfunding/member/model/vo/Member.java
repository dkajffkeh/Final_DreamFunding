package com.donjomjo.dreamfunding.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


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
	
	public Member() {}

	public Member(int memNo, String email, String memPwd, String memNick, String memName, String phone, Date memCreate,
			String gender, String memPfPath, String memSystemname, String memStatus, String memLink, String refresToken,
			String accessToken, String status) {
		super();
		this.memNo = memNo;
		this.email = email;
		this.memPwd = memPwd;
		this.memNick = memNick;
		this.memName = memName;
		this.phone = phone;
		this.memCreate = memCreate;
		this.gender = gender;
		this.memPfPath = memPfPath;
		this.memSystemname = memSystemname;
		this.memStatus = memStatus;
		this.memLink = memLink;
		this.refresToken = refresToken;
		this.accessToken = accessToken;
		this.status = status;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getMemCreate() {
		return memCreate;
	}

	public void setMemCreate(Date memCreate) {
		this.memCreate = memCreate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemPfPath() {
		return memPfPath;
	}

	public void setMemPfPath(String memPfPath) {
		this.memPfPath = memPfPath;
	}

	public String getMemSystemname() {
		return memSystemname;
	}

	public void setMemSystemname(String memSystemname) {
		this.memSystemname = memSystemname;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemLink() {
		return memLink;
	}

	public void setMemLink(String memLink) {
		this.memLink = memLink;
	}

	public String getRefresToken() {
		return refresToken;
	}

	public void setRefresToken(String refresToken) {
		this.refresToken = refresToken;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", email=" + email + ", memPwd=" + memPwd + ", memNick=" + memNick
				+ ", memName=" + memName + ", phone=" + phone + ", memCreate=" + memCreate + ", gender=" + gender
				+ ", memPfPath=" + memPfPath + ", memSystemname=" + memSystemname + ", memStatus=" + memStatus
				+ ", memLink=" + memLink + ", refresToken=" + refresToken + ", accessToken=" + accessToken + ", status="
				+ status + "]";
	}
	

}
