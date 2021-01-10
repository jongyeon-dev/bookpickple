package com.kh.bookpickple.manager.delivery.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.vo.Order;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Order> selectDeliveryList() {
		return sqlSession.selectList("deliveryMapper.selectDeliveryList");
	}

	@Override
	public List<Order> selectDeliveryDetail(Order order) {
		return sqlSession.selectList("deliveryMapper.selectDeliveryDetail", order);
	}
	
	@Override
	public boolean isFinished(Order order) {
		String isFinished = sqlSession.selectOne("deliveryMapper.isFinishedStatus", order);
		return Boolean.parseBoolean(isFinished);
	}
	
	@Override
	public int updateTotalPrice(Member member) {
		return sqlSession.update("deliveryMapper.updateTotalPrice", member);
	}
	
	@Override
	public int updatePoint(Member member) {
		return sqlSession.update("deliveryMapper.updatePoint", member);
	}

	@Override
	public int updateDeliveryStatus(Order order) {
		return sqlSession.update("deliveryMapper.updateDeliveryStatus", order);
	}

}
