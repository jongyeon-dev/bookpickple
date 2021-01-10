package com.kh.bookpickple.member.model.dao;

import java.util.HashMap;

import com.kh.bookpickple.member.model.vo.Member;

public interface MemberDAO {
	
	int checkIdDuplicate(HashMap<String, Object> hmap);
	
	int checkEmailDuplicate(HashMap<String, Object> hmap);
	
	int insertMember(Member member);
	
	Member loginMember(String userId);
	
	Member selectOneMember(int userNo);
	
	int updateMember(Member member);
	
	int deleteMember(int userNo);
	
	String findIdByEmail(String email);
	
	Member isExistMember(Member member);
	
	int updateNewPwd(Member member);

}
