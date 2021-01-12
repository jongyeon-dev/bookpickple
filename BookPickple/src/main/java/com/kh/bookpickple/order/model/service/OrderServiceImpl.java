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
		
		// 포인트를 사용 했든 안했든 member의 포인트 변경
		// 사용했으면 넘겨받은 0 값으로 바꿔주고
		// 사용 안했으면 기존에 갖고있던 포인트 그대로 다시 update
		int result2 = orderDAO.updateMemberPoint(order);
		
		int result3 = 0;
		
		for(int i = 0; i < orderDetail.size(); i++) {
			result3 = orderDAO.insertPayDetail(orderDetail.get(i));
			if(result3 == 0) throw new OrderException("결제 상세 정보 추가 실패");
			
			int result4 = orderDAO.deleteBooksFromCart(orderDetail.get(i));
			
			int result5 = orderDAO.updateBookStock(orderDetail.get(i));
		}
		
		return result1;
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, Order order) {
		return orderDAO.selectOrderList(cPage, numPerPage, order);
	}

	@Override
	public int selectOrderTotalContents(Order order) {
		return orderDAO.selectOrderTotalContents(order);
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return orderDAO.selectOrderDetailList(order);
	}

	@Override
	public int eachBookSalesCount(OrderDetail orderDetail) {
		return orderDAO.eachBookSalesCount(orderDetail);
	}

	@Override
	public int oneBookSalesCount(int bookNo) {
		return orderDAO.oneBookSalesCount(bookNo);
	}

	@Override
	public List<Order> selectPeriodOrderList(int cPage, int numPerPage, Order order) {
		return orderDAO.selectPeriodOrderList(cPage, numPerPage, order);
	}

	@Override
	public int selectSearchTotalContent(Order order) {
		return orderDAO.selectSearchTotalContent(order);
	}

}
