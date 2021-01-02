package com.kh.bookpickple.order.model.service;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderService {
	
	int insertPayRecord(Order order, List<OrderDetail> orderDetail);
	
	List<Order> selectOnePayRecordList(Order order);

}
