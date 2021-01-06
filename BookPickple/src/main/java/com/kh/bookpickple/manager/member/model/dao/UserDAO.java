package com.kh.bookpickple.manager.member.model.dao;

import java.util.List;

import com.kh.bookpickple.member.model.vo.Member;

public interface UserDAO {

	List<Member> selectMemberList();
	
	Member selectOneMember(int userNo);
}
