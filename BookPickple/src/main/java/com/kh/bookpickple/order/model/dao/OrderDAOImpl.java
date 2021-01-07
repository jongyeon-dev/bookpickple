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
	public int deleteBooksFromCart(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.deleteBooksFromCart", orderDetail);
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, int userNo) {
		return sqlSession.selectList("orderMapper.selectOrderList", userNo);
	}

	@Override
	public int selectOrderTotalContents(int userNo) {
		return sqlSession.selectOne("orderMapper.selectOrderTotalContents", userNo);
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return sqlSession.selectList("orderMapper.selectOrderDetailList", order);
	}

	@Override
	public int eachBookSalesCount(OrderDetail orderDetail) {
		return sqlSession.selectOne("orderMapper.eachBookSalesCount", orderDetail);
	}


}
