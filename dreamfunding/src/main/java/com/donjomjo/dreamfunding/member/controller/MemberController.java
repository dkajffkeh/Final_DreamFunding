package com.donjomjo.dreamfunding.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.member.model.service.MemberService;
import com.donjomjo.dreamfunding.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	

	@RequestMapping("loginForm.me.jm")
	public String loginForm() {
		return "member/loginForm";
	}
	@RequestMapping("login.me.jm")
	public String loginMember(Member m, HttpSession session) {
		
		
		
		
		
		return "";
	}
	@RequestMapping("enrollForm.me.jm")
	public String enrollForm() {
		return "member/enrollForm";
	}
	@RequestMapping("enrollForm2.me.jm")
	public String enrollForm2() {
		
		
		return "member/enrollForm2";
	}
	@RequestMapping("enrollForm3.me.jm")
	public String enrollForm3() {
		return "member/enrollForm3";
	}
	@RequestMapping("insert.me.jm")
	public void insertMember() {
		
	}
	@RequestMapping("update.me.jm")
	public void updateMember() {
		
	}
	@RequestMapping("delete.me.jm")
	public void deleteMember() {
		
	}
	
	
	}
