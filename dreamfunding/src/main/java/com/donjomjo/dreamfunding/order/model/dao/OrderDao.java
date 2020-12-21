package com.donjomjo.dreamfunding.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

@Repository
public class OrderDao {

	public ProjectInsert selectProject(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("orderMapper.selectProject", pno);
	}

}
