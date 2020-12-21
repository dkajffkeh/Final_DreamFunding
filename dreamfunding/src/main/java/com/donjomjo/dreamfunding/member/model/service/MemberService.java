package com.donjomjo.dreamfunding.member.model.service;

import com.donjomjo.dreamfunding.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(String String);
	
	int idCheck(String userId);
	
	
}