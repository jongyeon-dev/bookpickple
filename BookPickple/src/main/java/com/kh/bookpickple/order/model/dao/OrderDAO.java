package com.kh.bookpickple.order.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.Order;

public interface OrderDAO {

	int insertPayRecord(Order order);

	List<Order> selectOnePayRecordList(Order order);
}
