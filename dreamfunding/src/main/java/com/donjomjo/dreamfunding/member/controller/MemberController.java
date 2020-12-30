package com.donjomjo.dreamfunding.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		m.setMemPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공!");
			
		}
		
		
		return "redirect:/";
		
		
		
	}
	@RequestMapping("update.me.jm")
	public String updateMember(Member m, Model model, HttpSession session) {
		int result = mService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("loginMem", mService.loginMember(m));

			session.setAttribute("alertMsg", "성공적으로 변경되었습니다!");
		}
		
		return "redirect:/";
		
	}
	@RequestMapping("delete.me.jm")
	public String deleteMember(String userPwd, HttpSession session, Model model) {
		
		Member loginMem = (Member)session.getAttribute("loginMem");
		String encPwd = loginMem.getMemPwd();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			
			int result = mService.deleteMember(loginMem.getEmail());
			
			if(result > 0) {
				
				session.removeAttribute("loginMem");
				
				session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
				
			}
			
			return "redirect:/";
		}
		
		return "redirect:/";
	}


	}
