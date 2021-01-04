package com.kh.bookpickple.manager.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.manager.delivery.model.service.DeliveryService;
import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.vo.Order;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping("/manager/deliveryListView.do")
	public String deliveryListView(Model model) {
		List<Order> deliveryList = deliveryService.selectDeliveryList();
		model.addAttribute("deliveryList", deliveryList);
		return "manager/delivery/deliveryList";
	}
	
	@RequestMapping("/manager/deliveryDetail.do")
	public String deliveryDetail(Order order, @RequestParam int orderNo, Model model) {
		order.setOrderNo(orderNo);
		List<Order> deliveryDetail = deliveryService.selectDeliveryDetail(order);
		model.addAttribute("deliveryDetail", deliveryDetail);
		return "manager/delivery/deliveryDetail";
	}
	
	@RequestMapping("/manager/updateDeliveryStatus.do")
	@ResponseBody
	public String updateDeliveryStatus(Order order, Member member, @RequestParam int orderNo, @RequestParam String deliveryStatus,
									@RequestParam int userNo) {
		order.setOrderNo(orderNo);
		order.setDeliveryStatus(deliveryStatus);
		
		int result = deliveryService.updateDeliveryStatus(order);
		
		if(result > 0) {
			boolean isFinished = deliveryService.isFinished(order);
			
			if(isFinished) { // 배송완료면 포인트 적립
				member.setOrderNo(orderNo);
				member.setUserNo(userNo);
				int updatePoint = deliveryService.updatePoint(member);
			} 
		}
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
