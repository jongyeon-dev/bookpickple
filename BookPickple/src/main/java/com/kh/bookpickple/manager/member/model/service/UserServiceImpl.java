package com.kh.bookpickple.manager.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.manager.member.model.dao.UserDAO;
import com.kh.bookpickple.member.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public List<Member> selectMemberList() {
		return userDAO.selectMemberList();
	}

	@Override
	public Member seletOneMember(int userNo) {
		return userDAO.selectOneMember(userNo);
	}

}
