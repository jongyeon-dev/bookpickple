package com.kh.bookpickple.mypage.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;

public interface MyPageDAO {

	List<Order> selectOrderList(int cPage, int numPerPage, int userNo);
	
	int selectOrderTotalContents();
	
	List<Order> selectOrderDetailList(Order order);
}
