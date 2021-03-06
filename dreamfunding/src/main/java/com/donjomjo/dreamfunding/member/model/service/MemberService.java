package com.donjomjo.dreamfunding.member.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	int deleteMember(Member m);

	int emailCheck(String email);
	
	int nickCheck(String nick);

	String selectAddress(String email);

	int idFind(Member m);
	
	int updatePwd(Member m);
	
	int updateNick(Member m);
	
	int updateProfile(Member m);
	
	int updatePhone(Member m);

	String selectEmail(Member m);

	ArrayList<Member> memberList(Member m);
	
	
	
	
}
