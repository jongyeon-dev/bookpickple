package com.kh.bookpickple.manager.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Integer>> getDailyJoin() {
		return sqlSession.selectList("managerMainMapper.getDailyJoin");
	}
	
	@Override
	public int getMenCount() {
		return sqlSession.selectOne("managerMainMapper.getMenCount");
	}

	@Override
	public int getWomenCount() {
		return sqlSession.selectOne("managerMainMapper.getWomenCount");
	}

	@Override
	public List<Object> getSalesRatio() {
		return sqlSession.selectList("managerMainMapper.getSalesRatio");
	}

	@Override
	public List<Object> getAgeCount() {
		return sqlSession.selectList("managerMainMapper.getAgeCount");
	}
}
