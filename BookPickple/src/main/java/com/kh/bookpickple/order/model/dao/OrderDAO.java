package com.kh.bookpickple.order.model.dao;

import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

public interface OrderDAO {

	int insertPayRecord(Order order);
	
	int insertPayDetail(OrderDetail orderDetail);
	
	int deleteBooksFromCart(OrderDetail orderDetail);
}
