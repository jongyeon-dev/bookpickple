package com.kh.bookpickple.order.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public int updateMemberPoint(Order order) {
		return sqlSession.update("orderMapper.updateMemberPoint", order);
	}
	
	@Override
	public int insertPayDetail(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.insertPayDetail", orderDetail);
	}

	@Override
	public int deleteBooksFromCart(OrderDetail orderDetail) {
		return sqlSession.delete("orderMapper.deleteBooksFromCart", orderDetail);
	}
	
	@Override
	public int updateBookStock(OrderDetail orderDetail) {
		return sqlSession.update("orderMapper.updateBookStock", orderDetail);
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, Order order) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("orderMapper.selectOrderList", order, rows);
	}

	@Override
	public int selectOrderTotalContents(Order order) {
		return sqlSession.selectOne("orderMapper.selectOrderTotalContents", order);
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return sqlSession.selectList("orderMapper.selectOrderDetailList", order);
	}

	@Override
	public int eachBookSalesCount(OrderDetail orderDetail) {
		return sqlSession.selectOne("orderMapper.eachBookSalesCount", orderDetail);
	}

	@Override
	public int oneBookSalesCount(int bookNo) {
		return sqlSession.selectOne("orderMapper.oneBookSalesCount", bookNo);
	}

}
