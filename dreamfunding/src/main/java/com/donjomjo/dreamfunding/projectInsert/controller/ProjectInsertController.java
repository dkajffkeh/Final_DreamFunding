package com.donjomjo.dreamfunding.projectInsert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.projectInsert.model.service.ProjectInsertService;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;

@Controller
public class ProjectInsertController {
	
	@Autowired
	private ProjectInsertService pService;

	@RequestMapping(value="projectinsert.pi.hy")
	public String sendToProjectInsert(Model model) {
		
		ArrayList<ProjectCategory> list = pService.selectCategory();	
		
		model.addAttribute("list",list);
		return "projectInsert/projectInsertForm";
	}

}
