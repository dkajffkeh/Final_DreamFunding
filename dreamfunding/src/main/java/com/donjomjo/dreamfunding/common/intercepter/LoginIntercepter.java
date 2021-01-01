package com.donjomjo.dreamfunding.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sun.net.ssl.internal.www.protocol.https.Handler;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMem")==null){
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		} else {
			return true;
		}
	}
	
}

