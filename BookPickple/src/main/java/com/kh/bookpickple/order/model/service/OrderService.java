package com.kh.bookpickple.order.model.service;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;

public interface OrderService {
	
	int insertPayRecord(Order order);
	
	List<Order> selectOnePayRecordList(Order order);

}
