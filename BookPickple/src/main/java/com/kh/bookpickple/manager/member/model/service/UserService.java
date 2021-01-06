package com.kh.bookpickple.manager.member.model.service;

import java.util.List;

import com.kh.bookpickple.member.model.vo.Member;

public interface UserService {
	
	List<Member> selectMemberList();
	
	Member seletOneMember(int userNo);
}
