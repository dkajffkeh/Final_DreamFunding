package com.donjomjo.dreamfunding.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	
	@RequestMapping("daminIndex.ad")
	public String toAdminpage() {
		
		
		return "admin/adminMain";
		
	}

}
