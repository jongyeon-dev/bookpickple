package com.kh.bookpickple.order.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderDAO {

	int insertPayRecord(Order order);
	
	int updateMemberPoint(Order order);
	
	int insertPayDetail(OrderDetail orderDetail);
	
	int deleteBooksFromCart(OrderDetail orderDetail);
	
	int updateBookStock(OrderDetail orderDetail);
	
	List<Order> selectOrderList(int cPage, int numPerPage, Order order);
	
	int selectOrderTotalContents(Order order);
	
	List<Order> selectOrderDetailList(Order order);
	
	int eachBookSalesCount(OrderDetail orderDetail);
	
	int oneBookSalesCount(int bookNo);
	
	List<Order> selectPeriodOrderList(int cPage, int numPerPage, Order order);
	
	int selectSearchTotalContent(Order order);
}
