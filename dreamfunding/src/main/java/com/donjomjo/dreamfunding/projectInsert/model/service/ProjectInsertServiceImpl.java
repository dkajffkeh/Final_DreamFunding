package com.donjomjo.dreamfunding.projectInsert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.projectInsert.model.dao.ProjectInsertDao;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

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


	@Override
	public int selectProNo() {
		
		return pDao.selectProNo(sqlSession);
	}


	@Override
	public int insertProject(ProjectInsert pi, Reward r, RewardOption o) {
		
		//project부터 insert
		if(pDao.insertProject(sqlSession,pi)>0) {
			
				//reward insert
				for(int i = 0; i<r.getRewardList().size(); i++) {
					
					if(pDao.insertReward(sqlSession,r.getRewardList().get(i))==0) {
						return 0;
					}
					//option 인서트.
					for(int j = 0 ; j<r.getRewardList().get(i).getRewardAmount(); j++) {
							if(pDao.insertOption(sqlSession,o.getOptionList().get(j))==0) {
								return 0;
							}
					}					
				}
			return 1;
		} else {
			return 0;
		}
		
		
	}


	@Override
	public String urlconflictCheck(String urlInput) {
		
		return pDao.urlconflictCheck(sqlSession,urlInput);
	}
	
	
	

	
	
}
