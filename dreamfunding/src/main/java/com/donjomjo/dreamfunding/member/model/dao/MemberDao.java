package com.donjomjo.dreamfunding.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("memberMapper.deleteMember", email);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String nick) {
		
		return sqlSession.selectOne("memberMapper.nickCheck", nick);
	}
	public String selectAddress(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.selectAddress",email);
	}

	public int idFind(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m.getMemName());
		System.out.println(m.getPhone());
		return sqlSession.selectOne("memberMapper.idFind", m);
	}

}
