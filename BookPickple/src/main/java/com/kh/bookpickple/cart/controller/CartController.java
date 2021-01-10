package com.kh.bookpickple.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookpickple.cart.model.service.CartService;
import com.kh.bookpickple.cart.model.vo.Cart;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("/cart/insertCart.do")
	@ResponseBody 
	public String insertCart(Cart cart, @RequestParam int bookNo, @RequestParam int userNo, @RequestParam int quantity) {
		
		cart.setBookNo(bookNo);
		cart.setUserNo(userNo);
		cart.setQuantity(quantity);
		
		boolean exist = cartService.findCart(cart);
		
		if(exist == true) {
			return "exist";
		} else {
			cartService.insertCart(cart);
			return "insertCart";
		}
	}
	
	@RequestMapping("/cart/cartList.do")
	public String cartList(Cart cart, @RequestParam int userNo, Model model, HttpServletRequest request) {
		
		cart.setUserNo(userNo);
		
		Map<String, List> cartMap = cartService.selectCartList(cart);
		
		// @SessionAttributes로 담으면 다른 계정에 카트 기록이 남아있어서 이렇게 담음
		HttpSession session=request.getSession();
		session.setAttribute("cartMap", cartMap);
		
		model.addAttribute("cartMap", cartMap);
		
		return "cart/cartList";
	}
	
	@RequestMapping("/cart/updateCart.do")
	@ResponseBody
	public String updateCart(Cart cart, @RequestParam int userNo, @RequestParam int cartNo, 
							@RequestParam int bookNo, @RequestParam int quantity) {
		cart.setUserNo(userNo);
		cart.setCartNo(cartNo);
		cart.setBookNo(bookNo);
		cart.setQuantity(quantity);
		
		int result = cartService.updateCart(cart);
		
		if(result > 0) {
			return "updateCart";
		} else {
			return "updateCartFail";
		}
		
	}
	
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public String deleteCart(@RequestParam int cartNo) {
		
		int result = cartService.deleteCart(cartNo);
		
		if(result > 0) {
			return "deleteCart";
		} else {
			return "deleteCartFail";
		}
	}

}
