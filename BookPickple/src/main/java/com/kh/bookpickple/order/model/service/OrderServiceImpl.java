package com.kh.bookpickple.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.common.exception.OrderException;
import com.kh.bookpickple.order.model.dao.OrderDAO;
import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public int insertPayRecord(Order order, List<OrderDetail> orderDetail) throws OrderException {
		int result1 = orderDAO.insertPayRecord(order);
		
		if(result1 == 0) throw new OrderException();
		
		int result2 = 0;
		
		for(int i = 0; i < orderDetail.size(); i++) {
			result2 = orderDAO.insertPayDetail(orderDetail.get(i));
			if(result2 == 0) throw new OrderException("결제 상세 정보 추가 실패");
			
			int result3 = orderDAO.deleteBooksFromCart(orderDetail.get(i));
		}
		
		return result1;
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, int userNo) {
		return orderDAO.selectOrderList(cPage, numPerPage, userNo);
	}

	@Override
	public int selectOrderTotalContents() {
		return orderDAO.selectOrderTotalContents();
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return orderDAO.selectOrderDetailList(order);
	}

}
