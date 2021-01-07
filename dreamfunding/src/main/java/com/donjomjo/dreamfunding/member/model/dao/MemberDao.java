package com.donjomjo.dreamfunding.member.model.dao;

import java.util.ArrayList;

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
		
		return sqlSession.selectOne("memberMapper.idFind", m);
	}
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	public int updateNick(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateNick", m);
	}
	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {

	      

	      return sqlSession.update("memberMapper.updateProfile", m);
	   }
	public int updatePhone(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePhone", m);
	}

	public String selectEmail(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.selectEmail", m);
	}

	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, Member m) {
	

		return (ArrayList)sqlSession.selectList("memberMapper.memberList", m);
		
	}
	
	
	

}
