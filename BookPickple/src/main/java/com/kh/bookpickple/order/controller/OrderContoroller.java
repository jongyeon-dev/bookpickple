package com.kh.bookpickple.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookpickple.order.model.service.OrderService;
import com.kh.bookpickple.order.model.vo.Order;

@SessionAttributes(value= { "orderList" })
@Controller
public class OrderContoroller {
	
	@Autowired
	OrderService orderService;

	@RequestMapping("/order/eachOrder.do")
	public ModelAndView eachOrder(@ModelAttribute("order") Order order, Model model) {
		ModelAndView mv = new ModelAndView();
		
		if(order.getBookNo() == 0) {
			mv.setViewName("redirect:/");
		} else {
			List<Order> orderList = new ArrayList<Order>();
			orderList.add(order);
			mv.addObject(orderList);
			mv.setViewName("order/orderForm");
		}
		
		return mv;
	}
	
	@RequestMapping("/order/orderPayment.do")
	public String orderPayment() {
		return null;
	}
}
