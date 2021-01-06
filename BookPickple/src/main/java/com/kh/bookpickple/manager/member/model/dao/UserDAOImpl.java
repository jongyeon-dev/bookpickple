package com.kh.bookpickple.manager.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.member.model.vo.Member;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("managerMemberMapper.selectMemberList");
	}

	@Override
	public Member selectOneMember(int userNo) {
		return sqlSession.selectOne("managerMemberMapper.selectOneMember", userNo);
	}

}
