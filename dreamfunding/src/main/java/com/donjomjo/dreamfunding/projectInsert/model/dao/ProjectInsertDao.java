package com.donjomjo.dreamfunding.projectInsert.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<ProjectInsert> selectProject(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("proInsertMapper.selectProjectHY",memNo);
	}

	public int projectNumberCheck(SqlSessionTemplate sqlSession, int projectNo) {
		
		return sqlSession.selectOne("proInsertMapper.projectNumberCheck", projectNo);
	}

	public int projectUpdateOnly(SqlSessionTemplate sqlSession, ProjectInsert pi) {
		
		return sqlSession.update("proInsertMapper.projectUpdateOnly", pi);
	}

	public int deleteReward(SqlSessionTemplate sqlSession, int projectNo) {
		
		return sqlSession.delete("proInsertMapper.deleteReward",projectNo);
	}

	public int insertRewardOnly(SqlSessionTemplate sqlSession, Reward reward) {
		
		return sqlSession.insert("proInsertMapper.insertReward", reward);
	}

	public int insertRewardOptionOnly(SqlSessionTemplate sqlSession, RewardOption ro) {
		
		return sqlSession.insert("proInsertMapper.insertOption", ro);
	}

	public ProjectInsert ajaxProjectSelector(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("proInsertMapper.ajaxProjectSelector", pno);
	}

	public ArrayList<Reward> ajaxRewardSelector(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("proInsertMapper.ajaxRewardSelector", pno);
	}

	public ArrayList<RewardOption> ajaxOptionSelector(SqlSessionTemplate sqlSession, String[] rList) {
		
		return (ArrayList)sqlSession.selectList("proInsertMapper.ajaxOptionSelector",rList);
	}

	public String reloadUrlConflictCheck(SqlSessionTemplate sqlSession, String urlInput, String pno) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("urlInput", urlInput);
		map.put("pno",pno);
		
		return sqlSession.selectOne("proInsertMapper.reloadUrlConflictCheck", map);
	}

	public int insertCKEDitor(SqlSessionTemplate sqlSession, String filename, String filepath) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("filename", filename);
		map.put("filepath",filepath);
		
		return sqlSession.insert("proInsertMapper.insertCKEDitor",map);
	}

	public ProjectInsert preViewProjectSelector(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("proInsertMapper.preViewProjectSelector",pno);
	}

	

	

	

}
