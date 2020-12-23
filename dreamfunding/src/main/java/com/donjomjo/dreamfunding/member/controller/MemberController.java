package com.donjomjo.dreamfunding.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.donjomjo.dreamfunding.member.model.service.MemberService;
import com.donjomjo.dreamfunding.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	@RequestMapping("loginForm.me.jm")
	public String loginForm() {
		
		return "member/loginForm";
		
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
	@RequestMapping("login.me.jm")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginMem = mService.loginMember(m);
		
		if(loginMem != null) {
			session.setAttribute("loginMem", loginMem );
			mv.setViewName("redirect:/");
		
		}
		
		return mv;
		
	}
	@RequestMapping("logout.me.jm")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
