package com.kh.bookpickple.order.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookpickple.order.model.service.OrderService;
import com.kh.bookpickple.order.model.vo.Order;

@SessionAttributes("orderList")
@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

	@RequestMapping("/order/eachOrder.do")
	public ModelAndView eachOrder(@ModelAttribute Order order) {
		ModelAndView mv = new ModelAndView();
		
		if(order.getBookNo() == 0) {
			mv.setViewName("redirect:/");
		} else {
			List<Order> orderList = new ArrayList<Order>();
			System.out.println("payRecord::::::::::" + order);
			orderList.add(order);
			mv.addObject(orderList); // 주문서 작성 부분이기 때문에 세션으로 둔다.
			
			System.out.println("list::::::::::::" + orderList);
			System.out.println(orderList.size());
			mv.setViewName("order/orderForm");
		}
		
		return mv;
	}
	
	@RequestMapping("/order/orderPayment.do")
	@ResponseBody
	public String orderPayment(Order order, Model model) {
		
		 Calendar cal = Calendar.getInstance();
		  int year = cal.get(Calendar.YEAR);
		  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		  String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		  String subNum = "";
		  
		  for(int i = 1; i <= 6; i ++) {
		   subNum += (int)(Math.random() * 10);
		  }
		  
		  String orderNo = "BP" + ymd + "_" + subNum; //ex) BP20210101_373063
		  order.setOrderNo(orderNo);
		  
		  System.out.println(order);
		
		int result = orderService.insertPayRecord(order);
		
		System.out.println(result);
		
		if(result > 0) {
			//model.addAttribute(orderNo);
			return orderNo;
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("/order/orderSuccess.do")
	public String orderSuccess(Order order, @RequestParam String orderNo, @RequestParam int userNo, Model model) {
		order.setOrderNo(orderNo);
		order.setUserNo(userNo);
		
		List<Order> payList = orderService.selectOnePayRecordList(order);
		
		model.addAttribute("payList", payList);
		
		
		return "order/orderSuccess";
	}
	
	@RequestMapping("/order/orderFail.do")
	public String orderFail() {
		return "order/orderFail";
	}
}
