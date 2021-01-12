package com.kh.bookpickple.manager.delivery.model.dao;

import java.util.List;

import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.vo.Order;

public interface DeliveryDAO {
	
	List<Order> selectDeliveryList(Order order);
	
	List<Order> selectDeliveryDetail(Order order);
	
	boolean isFinished(Order order);
	
	int updateTotalPrice(Member member);
	
	int updatePoint(Member member);

	int updateDeliveryStatus(Order order);
	
}
