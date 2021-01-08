package com.kh.bookpickple.mail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOImpl implements MailDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<String> receiverList() {
		return sqlSession.selectList("managerMemberMapper.EmailReceiverList");
	}

}
