package com.kh.bookpickple.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.member.model.dao.MemberDAO;
import com.kh.bookpickple.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}
	
	@Override
	public int checkEmailDuplicate(String email) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", email);
		
		return memberDAO.checkEmailDuplicate(hmap);
	}

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public Member loginMember(String userId) {
		return memberDAO.loginMember(userId);
	}

	@Override
	public Member selectOneMember(int userNo) {
		return memberDAO.selectOneMember(userNo);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(int userNo) {
		return memberDAO.deleteMember(userNo);
	}

}
