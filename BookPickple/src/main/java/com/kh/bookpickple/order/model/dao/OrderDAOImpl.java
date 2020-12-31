package com.kh.bookpickple.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.order.model.vo.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertOrder(Order order) {
		return sqlSession.insert("orderMapper.insertOrder", order);
	}

}
