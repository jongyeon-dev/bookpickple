package com.kh.bookpickple.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		return (Integer)hmap.get("result");
	}
	
	@Override
	public int checkEmailDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.checkEmailDuplicate", hmap);
		return (Integer)hmap.get("result");
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	@Override
	public Member loginMember(String userId) {
		return sqlSession.selectOne("memberMapper.loginMember", userId);
	}

	@Override
	public Member selectOneMember(int userNo) {
		return sqlSession.selectOne("memberMapper.selectOneMember", userNo);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	@Override
	public int deleteMember(int userNo) {
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}

	@Override
	public String findIdByEmail(String email) {
		return sqlSession.selectOne("memberMapper.findIdByEmail", email);
	}

	@Override
	public Member isExistMember(Member member) {
		return sqlSession.selectOne("memberMapper.isExistMember", member);
	}

	@Override
	public int updateNewPwd(Member member) {
		return sqlSession.update("memberMapper.updateNewPwd", member);
	}

}
