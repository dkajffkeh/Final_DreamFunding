package com.donjomjo.dreamfunding.member.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donjomjo.dreamfunding.member.model.service.MemberService;
import com.donjomjo.dreamfunding.member.util.Gmail;


@Controller
public class EmailController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	@RequestMapping("email.me.jm")
	public String emailCheck(String email) {
		Properties p = new Properties();
		

		String host = "http://localhost:8888/dreamfunding/";
		String from = "dreamfunding001@gmail.com";
		String address = mService.selectAddress(email);

		String content = "안녕하세요 드림펀딩 입니다." + "<a href='"+ host + "pwModify.me.jm?email=" + email +"'>비밀번호 수정하기</a>" ;  //여기에 이메일 보낼 내용적는겁니다.
		
		p.put("mail.smtp.user","구글 이메일계정");
		p.put("mail.smtp.host","smtp.googlemail.com");
		p.put("mail.smtp.port","465");
		p.put("mail.smtp.starttls","true");
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.debug","true");
		p.put("mail.smtp.socketFactory.port","465");
		p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback","false");
		
		try {
			
			Authenticator auth = new Gmail();
			Session session = Session.getInstance(p,auth);
			session.setDebug(true);
			
			MimeMessage msg = new MimeMessage(session);
			msg.setSubject("[드림펀딩]비밀번호 수정 링크 페이지 입니다.");
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(content,"text/html;charset=UTF-8");
			
			Transport.send(msg);
			
			
		} catch(Exception e) {
			e.printStackTrace();			
		}
		
		return "member/loginForm";
	}
	

	
}
