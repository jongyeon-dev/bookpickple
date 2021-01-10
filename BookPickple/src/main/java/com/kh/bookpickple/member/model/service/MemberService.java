package com.kh.bookpickple.member.model.service;

import com.kh.bookpickple.member.model.vo.Member;

public interface MemberService {
	
	int checkIdDuplicate(String userId);
	
	int checkEmailDuplicate(String email);
	
	int insertMember(Member member);
	
	Member loginMember(String userId);
	
	Member selectOneMember(int userNo);
	
	int updateMember(Member member);

	int deleteMember(int userNo);
	
	String findIdByEmail(String email);
	
	Member isExistMember(Member member);
	
	int updateNewPwd(Member member);
	
	void sendMail(String to, String subject, String body);

}
