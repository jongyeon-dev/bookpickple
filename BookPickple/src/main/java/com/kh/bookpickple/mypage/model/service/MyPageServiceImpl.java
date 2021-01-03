package com.kh.bookpickple.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.mypage.model.dao.MyPageDAO;
import com.kh.bookpickple.order.model.vo.Order;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO myPageDAO;

	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, int userNo) {
		return myPageDAO.selectOrderList(cPage, numPerPage, userNo);
	}

	@Override
	public int selectOrderTotalContents() {
		return myPageDAO.selectOrderTotalContents();
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return myPageDAO.selectOrderDetailList(order);
	}

}
