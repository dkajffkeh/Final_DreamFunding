package com.donjomjo.dreamfunding.projectInsert.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;

public interface ProjectInsertService {
	
	public ArrayList<ProjectCategory> selectCategory();
	
	public ArrayList<Bank> selectBank();
	
	
	

}
