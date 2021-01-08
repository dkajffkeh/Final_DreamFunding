package com.donjomjo.dreamfunding.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.member.model.dao.MemberDao;
import com.donjomjo.dreamfunding.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao mDao;
	
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}



	@Override
	public int deleteMember(Member m) {
		return mDao.deleteMember(sqlSession, m);
	}

	@Override
	public int emailCheck(String email) {
		
		return mDao.emailCheck(sqlSession, email);
	}

	@Override
	public int nickCheck(String nick) {
		
		return mDao.nickCheck(sqlSession, nick);
	}

	@Override
	public String selectAddress(String email) {
		
		return mDao.selectAddress(sqlSession, email);
	}

	@Override
	public int idFind(Member m) {
		
		return mDao.idFind(sqlSession, m);
	}
	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}

	@Override
	public int updateNick(Member m) {
		
		return mDao.updateNick(sqlSession, m);
	}

	@Override
	public int updateProfile(Member m) {
		return mDao.updateProfile(sqlSession, m);
	}

	@Override
	public int updatePhone(Member m) {
		return mDao.updatePhone(sqlSession, m);
	}

	@Override
	public String selectEmail(Member m) {
		
		return mDao.selectEmail(sqlSession, m);
	}

	@Override
	public ArrayList<Member> memberList(Member m) {
		
		return mDao.memberList(sqlSession, m);
	}




	
	
	
	
	
	
}
