package com.donjomjo.dreamfunding.projectInsert.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

public interface ProjectInsertService {
	
	public ArrayList<ProjectInsert> selectProject(int memNo);
	
	public ArrayList<ProjectCategory> selectCategory();
	
	public int insertProject(ProjectInsert pi, Reward r ,RewardOption o);
	
	public ArrayList<Bank> selectBank();
	
	public int selectProNo();
	
	public String urlconflictCheck(String urlInput);
	
	public int projectNumberCheck(ProjectInsert pi);
	
	public int insertProjectOnly(ProjectInsert pi);
	
	public int projectUpdateOnly(ProjectInsert pi);
	
	public int projectUpdate(ProjectInsert pi,Reward r ,RewardOption o);
}
