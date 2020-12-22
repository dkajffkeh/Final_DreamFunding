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

	@Override
	public ArrayList<ProjectCategory> selectCategory() {return pDao.selectCategory(sqlSession);}

	@Override
	public ArrayList<Bank> selectBank() {return pDao.selectBank(sqlSession);}

	@Override
	public int selectProNo() {return pDao.selectProNo(sqlSession);}


	@Override
	public String urlconflictCheck(String urlInput) {return pDao.urlconflictCheck(sqlSession,urlInput);}

	@Override
	public ArrayList<ProjectInsert> selectProject(int memNo) {return pDao.selectProject(sqlSession,memNo);}

	@Override
	public int projectNumberCheck(ProjectInsert pi) {return pDao.projectNumberCheck(sqlSession,pi.getProjectNo());}

	@Override
	public int insertProjectOnly(ProjectInsert pi) {return pDao.insertProject(sqlSession, pi);}

	@Override
	public int projectUpdateOnly(ProjectInsert pi) {return pDao.projectUpdateOnly(sqlSession,pi);}

	@Override
	public int projectUpdate(ProjectInsert pi, Reward r, RewardOption o) {return 0;}
	@Override
	public int deleteReward(ProjectInsert pi) {return pDao.deleteReward(sqlSession,pi.getProjectNo());}
	
	@Override
	public int insertProject(ProjectInsert pi, Reward r, RewardOption o) {
		
		//project부터 insert
		if(pDao.insertProject(sqlSession,pi)>0) {
			
			//reward insert
			for(int i = 0; i<r.getRewardList().size(); i++) {
				
				if(pDao.insertReward(sqlSession,r.getRewardList().get(i))==0) {
					return 0;
				}
				if(o.getOptionList()!=null) {
				//option 인서트.
				for(int j = 0 ; j<r.getRewardList().get(i).getRewardAmount(); j++) {
					if(pDao.insertOption(sqlSession,o.getOptionList().get(0))==0) {
						return 0;
					}
				o.getOptionList().remove(0);
				}
				}
				
			}
			return 1;
		} else {
			return 0;
		}	
		
	}
	@Override
	public int insertRewardOnly(Reward r, RewardOption ro) {
		
		for(int i = 0; i < r.getRewardList().size(); i++) {
			
			if(pDao.insertRewardOnly(sqlSession,r.getRewardList().get(i))==0) {
				return 0;
			}
			//ro 가 null 이 아닐경우 실행
			if(ro.getOptionList()!=null) {
			
			for(int j = 0 ; j < r.getRewardList().get(i).getRewardAmount() ; j++) {
				
				if(pDao.insertRewardOptionOnly(sqlSession,ro.getOptionList().get(0))==0) {
					
					return 0;
				}
				
				ro.getOptionList().remove(0);
				
			}
			
			}
			
		}
		
		
		return 1;
	}
	
	

	
	
}
