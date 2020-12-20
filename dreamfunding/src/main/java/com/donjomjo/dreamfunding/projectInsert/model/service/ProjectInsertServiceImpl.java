package com.donjomjo.dreamfunding.projectInsert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.projectInsert.model.dao.ProjectInsertDao;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;

@Service
public class ProjectInsertServiceImpl implements ProjectInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectInsertDao pDao;

	
	/**
	 * Select Category
	 */
	@Override
	public ArrayList<ProjectCategory> selectCategory() {
		
		return pDao.selectCategory(sqlSession);
		}


	@Override
	public ArrayList<Bank> selectBank() {
		
		return pDao.selectBank(sqlSession);
	}
	
	
	

	
	
}
