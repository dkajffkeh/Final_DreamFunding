package com.donjomjo.dreamfunding.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donjomjo.dreamfunding.member.model.service.MemberService;
import com.donjomjo.dreamfunding.member.model.vo.Member;
import com.donjomjo.dreamfunding.member.util.Gmail;
import com.donjomjo.dreamfunding.member.util.SHA256;


@Controller
public class EmailController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@ResponseBody
	@RequestMapping("email.me.jm")
	public String emailCheck(String email) {
		Properties p = new Properties();
		
		String hash = new SHA256().getSHA256(email);
		String host = "http://localhost:8888/dreamfunding";
		String from = "dreamfunding001@gmail.com";
		
		
		String content = "안녕하세요 드림펀딩 입니다. 회원님의 비밀번호는"+ mService.selectAddress(email) +"입니다." ;  //여기에 이메일 보낼 내용적는겁니다.
		
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
			msg.setSubject("[드림펀딩]");
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(content,"text/html;charset=UTF-8");
			
			Transport.send(msg);
			
			
		} catch(Exception e) {
			e.printStackTrace();			
		}
		System.out.println(email);
		return "member/loginForm";
	}

	
}
