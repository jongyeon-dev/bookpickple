package com.kh.bookpickple.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.order.model.dao.OrderDAO;
import com.kh.bookpickple.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public int insertOrder(Order order) {
		return orderDAO.insertOrder(order);
	}

}
