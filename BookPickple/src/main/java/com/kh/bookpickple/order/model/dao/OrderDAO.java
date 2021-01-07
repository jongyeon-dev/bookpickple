package com.kh.bookpickple.order.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderDAO {

	int insertPayRecord(Order order);
	
	int insertPayDetail(OrderDetail orderDetail);
	
	int deleteBooksFromCart(OrderDetail orderDetail);
	
	List<Order> selectOrderList(int cPage, int numPerPage, int userNo);
	
	int selectOrderTotalContents(int userNo);
	
	List<Order> selectOrderDetailList(Order order);
	
	int eachBookSalesCount(OrderDetail orderDetail);
}
