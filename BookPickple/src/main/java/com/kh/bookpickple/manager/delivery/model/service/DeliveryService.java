package com.kh.bookpickple.manager.delivery.model.service;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;

public interface DeliveryService {

	List<Order> selectDeliveryList();
	
	List<Order> selectDeliveryDetail(Order order);
	
	int updateDeliveryStatus(Order order);

}
