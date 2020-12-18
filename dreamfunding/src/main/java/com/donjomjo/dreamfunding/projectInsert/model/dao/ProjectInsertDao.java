package com.donjomjo.dreamfunding.projectInsert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectCategory;

@Repository
public class ProjectInsertDao {

	public ArrayList<ProjectCategory> selectCategory(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("proInsertMapper.selectCategory");
	}

}
