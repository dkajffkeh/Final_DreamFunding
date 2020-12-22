package com.donjomjo.dreamfunding.detail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donjomjo.dreamfunding.detail.model.dao.DetailDao;
import com.donjomjo.dreamfunding.detail.model.service.DetailService;

@Controller 
public class DetailController {

	@Autowired
	private DetailService dService;
	
	@Autowired
	private DetailDao dDao;
	
	
	@RequestMapping(value="detailStory.de")
	public String selectDetailAll() {
		return "detail/detailStory"; 
		
	}
	
}
