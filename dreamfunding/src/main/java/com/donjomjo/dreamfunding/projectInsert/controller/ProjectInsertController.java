package com.donjomjo.dreamfunding.projectInsert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.donjomjo.dreamfunding.projectInsert.model.service.ProjectInsertService;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

@Controller
public class ProjectInsertController {
	
	@Autowired
	private ProjectInsertService pService;

	@RequestMapping(value="projectinsert.pi.hy")
	public String sendToProjectInsert(Model model) {
		
		ArrayList<ProjectCategory> cList = pService.selectCategory();
		ArrayList<Bank> bList = pService.selectBank();
		
		model.addAttribute("bList",bList);
		model.addAttribute("cList",cList);
		return "projectInsert/projectInsertForm";
		
	}
	@RequestMapping(value="projectRequest.pi.hy")
	public String insertProject(MultipartHttpServletRequest mtf,ProjectInsert pi ,Reward r, RewardOption o,Model model) {
			
		
		
		return null;
	}

}
