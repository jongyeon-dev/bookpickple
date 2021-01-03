package com.kh.bookpickple.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.mypage.model.service.MyPageService;
import com.kh.bookpickple.order.model.vo.Order;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;

	@RequestMapping("/mypage/order/orderListView.do")
	public String orderListView(@RequestParam int userNo,  @RequestParam( value="cPage", required=false, defaultValue="1") 
								int cPage,  Model model) {
		int numPerPage = 10;
		List<Order> myOrderList = myPageService.selectOrderList(cPage, numPerPage, userNo);
		int totalContents = myPageService.selectOrderTotalContents();
		String pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "orderListView.do");
	
		model.addAttribute("myOrderList", myOrderList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/order/orderList";
	}
	
	@RequestMapping("/mypage/order/orderDetail.do")
	public String orderDetail(@RequestParam int userNo, @RequestParam int orderNo, Model model) {
		Order order = new Order();
		order.setUserNo(userNo);
		// order.setOrderNo(Integer.parseInt(orderNo.substring(0, 1)));
		order.setOrderNo(orderNo);
		List<Order> myOrderDetailList = myPageService.selectOrderDetailList(order);
		System.out.println(myOrderDetailList);
		model.addAttribute("myOrderDetailList", myOrderDetailList);
		return "mypage/order/orderDetail";
	}
}
