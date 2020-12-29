package com.donjomjo.dreamfunding.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.admin.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	@RequestMapping("daminIndex.ad")
	public String toAdminpage() {
		
		
		return "admin/adminMain";
		
	}
	
	@RequestMapping("reportHandler.rh")
	public String toReportHandler(Model model) {
		
		model.addAttribute("rList", rService.selectReportList());
		
		return "admin/reportHandler";
	}

}
