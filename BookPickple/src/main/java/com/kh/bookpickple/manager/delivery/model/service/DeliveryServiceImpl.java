package com.kh.bookpickple.manager.delivery.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.manager.delivery.model.dao.DeliveryDAO;
import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.vo.Order;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	
	@Autowired
	DeliveryDAO deliveryDAO;

	@Override
	public List<Order> selectDeliveryList() {
		return deliveryDAO.selectDeliveryList();
	}

	@Override
	public List<Order> selectDeliveryDetail(Order order) {
		return deliveryDAO.selectDeliveryDetail(order);
	}
	
	@Override
	public boolean isFinished(Order order) {
		return deliveryDAO.isFinished(order);
	}
	
	@Override
	public int updateTotalPrice(Member member) {
		return deliveryDAO.updateTotalPrice(member);
	}
	
	@Override
	public int updatePoint(Member member) {
		return deliveryDAO.updatePoint(member);
	}

	@Override
	public int updateDeliveryStatus(Order order) {
		int result = deliveryDAO.updateDeliveryStatus(order);
		return result;
	}

}
