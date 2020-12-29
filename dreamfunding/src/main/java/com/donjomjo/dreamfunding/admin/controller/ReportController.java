package com.donjomjo.dreamfunding.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private String toReportHandler(Model model) {
		
		model.addAttribute("rList", rService.selectReportList());
		
		return "admin/reportHandler";
	}
	
	@RequestMapping("reportDetail.re")
	private String toDetailPage(int rno,Model model) {
		
		model.addAttribute("report", rService.selectReport(rno));
		
		
		return "admin/reportDetailview";
	}
	
	@ResponseBody
	@RequestMapping("projectBlind.ad")
	private int projectBlind(int pno, int rno) {	
		
		return rService.projectBlind(pno, rno);
	}


	@ResponseBody
	@RequestMapping("proofreadDone.ad")
	private int projectBlind(int rno) {	
		
		return rService.reportProfreadDone(rno);
	}
}