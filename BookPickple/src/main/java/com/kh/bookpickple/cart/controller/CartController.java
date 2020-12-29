package com.kh.bookpickple.cart.controller;

import java.util.List;
import java.util.Map;

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

@SessionAttributes(value= { "cartMap" })
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
	public ModelAndView cartList(Cart cart, @RequestParam int userNo, Model model) {
		
		ModelAndView mv = new ModelAndView();
		
		cart.setUserNo(userNo);
		Map<String, List> cartMap = cartService.selectCartList(cart);
		
		System.out.println(cartMap);
		
		mv.addObject("cartMap", cartMap);
		
		mv.setViewName("cart/cartList");
	
		return mv;
	}

}
