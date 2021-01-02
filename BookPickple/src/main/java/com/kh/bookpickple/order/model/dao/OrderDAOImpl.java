package com.kh.bookpickple.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertPayRecord(Order order) {
		return sqlSession.insert("orderMapper.insertPayRecord", order);
	}
	
	@Override
	public int insertPayDetail(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.insertPayDetail", orderDetail);
	}
	
	@Override
	public String findOrderNum(Order order) {
		return sqlSession.selectOne("orderMapper.findOrderNum", order);
	}

	@Override
	public List<Order> selectOnePayRecordList(String orderNum) {
		return sqlSession.selectList("orderMapper.selectOnePayRecord", orderNum);
	}

}
