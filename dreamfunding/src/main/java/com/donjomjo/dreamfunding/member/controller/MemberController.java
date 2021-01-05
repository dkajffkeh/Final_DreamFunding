package com.donjomjo.dreamfunding.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.donjomjo.dreamfunding.member.model.service.MemberService;
import com.donjomjo.dreamfunding.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	
	@RequestMapping("findMember.me.jm")
	public String findMember() {
		return "member/findMember";
	}
	@RequestMapping("idForm.me.jm")
	public String idForm() {
		return "member/idForm";
	}
	@RequestMapping("pwForm.me.jm")
	public String pwForm() {
		return "member/pwForm";
	}
	@RequestMapping("redirect.me.jm")
	public String redirect() {
		return "redirect:/";
	}
	
	
	
	
	
	@RequestMapping("login.me.jm")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginMem = mService.loginMember(m);
		
		if(loginMem != null) {
			session.setAttribute("loginMem", loginMem );
			mv.setViewName("redirect:/");
		
		}else {
			
			mv.setViewName("member/loginForm");
			session.setAttribute("alertMsg", "로그인 실패");
			
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
	@ResponseBody
	@RequestMapping(value="message.me.jm")
	public String message(HttpSession session, String phone) {
		String api_key = "NCSOS7YWFCF3SGWD";
	    String api_secret = "WV56MGDCXLSATWCGEBMX1RZWNILYKJBO";
	    
	    Message coolsms = new Message(api_key, api_secret);
	    String random =  (int)(Math.random() * 10) +""+(int)(Math.random() * 10) +""+(int)(Math.random() * 10) +""+(int)(Math.random() * 10) +""+(int)(Math.random() * 10) +""+(int)(Math.random() * 10) +"";
	    String certifyNum = random;
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01083658879");
	    params.put("from", phone );
	    params.put("type", "SMS");
	    params.put("text", "[드림펀딩] 인증번호 " + certifyNum + " 입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    return certifyNum;
	}
	

	@ResponseBody
	@RequestMapping("certify.me.jm")
	public String certify(String certify,String check) {
		
		int result = 0;
		
		if(certify.equals(check)) {
			result = 1;
		}
		
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping("emailCheck.me.jm")
	public String idCheck(String email) {
		
		return String.valueOf(mService.emailCheck(email));
	}
	
	@ResponseBody
	@RequestMapping(value="memNickCheck.me.jm" )
	public String nickCheck(String memNick) {
		
		return String.valueOf(mService.nickCheck(memNick));
	}
}
