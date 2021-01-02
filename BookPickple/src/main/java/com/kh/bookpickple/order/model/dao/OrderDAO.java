package com.kh.bookpickple.order.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderDAO {

	int insertPayRecord(Order order);
	
	int insertPayDetail(OrderDetail orderDetail);

	String findOrderNum(Order order);
	
	List<Order> selectOnePayRecordList(String orderNum);
}
