package com.donjomjo.dreamfunding.member.model.service;

import com.donjomjo.dreamfunding.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(String email);

	int emailCheck(String email);
	
	int nickCheck(String nick);

	String selectAddress(String email);
	
	int idFind(Member m);
	
}
