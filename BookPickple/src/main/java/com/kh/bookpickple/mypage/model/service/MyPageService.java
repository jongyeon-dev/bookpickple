package com.kh.bookpickple.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.order.model.vo.Order;

public interface MyPageService {
	
	List<Order> selectOrderList(int cPage, int numPerPage, int userNo);
	
	int selectOrderTotalContents();
	
	List<Order> selectOrderDetailList(Order order);

}
