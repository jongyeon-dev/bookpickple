package com.kh.bookpickple.order.model.service;

import java.util.List;

import com.kh.bookpickple.common.exception.OrderException;
import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderService {
	
	int insertPayRecord(Order order, List<OrderDetail> orderDetail) throws OrderException;
	
	List<Order> selectOrderList(int cPage, int numPerPage, int userNo);
	
	int selectOrderTotalContents(int userNo);
	
	List<Order> selectOrderDetailList(Order order);
	
	int eachBookSalesCount(OrderDetail orderDetail);
	
	int oneBookSalesCount(int bookNo);
}
