package com.donjomjo.dreamfunding.projectInsert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.projectInsert.model.vo.Bank;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;
import com.donjomjo.dreamfunding.projectInsert.model.vo.Reward;
import com.donjomjo.dreamfunding.projectInsert.model.vo.RewardOption;

@Repository
public class ProjectInsertDao {

	public ArrayList<ProjectCategory> selectCategory(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("proInsertMapper.selectCategory");
	}

	public ArrayList<Bank> selectBank(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("proInsertMapper.selectBank");
	}

	public int selectProNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("proInsertMapper.selectProNo");
	}

	public int insertProject(SqlSessionTemplate sqlSession, ProjectInsert pi) {
		
		return sqlSession.insert("proInsertMapper.insertProject", pi);
	}

	public int insertReward(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.insert("proInsertMapper.insertReward", r);
	}

	public int insertOption(SqlSessionTemplate sqlSession, RewardOption ro) {
		// TODO Auto-generated method stub
		return sqlSession.insert("proInsertMapper.insertOption", ro);
	}

	public String urlconflictCheck(SqlSessionTemplate sqlSession,String urlInput) {
		
		return sqlSession.selectOne("proInsertMapper.urlconflictCheck",urlInput);
	}

	

	

	

}
