package com.donjomjo.dreamfunding.detail.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.detail.model.dao.DetailDao;
import com.donjomjo.dreamfunding.detail.model.vo.Detail;

@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DetailDao dDao;
	
	@Override
	public Detail selectDetailAll() {
		return null;
	}
	
}
