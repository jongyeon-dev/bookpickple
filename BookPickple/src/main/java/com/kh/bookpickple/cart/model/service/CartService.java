package com.kh.bookpickple.cart.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.cart.model.vo.Cart;

public interface CartService {

	boolean findCart(Cart cart);
	
	int insertCart(Cart cart);
	
	Map<String ,List> selectCartList(Cart cart);

	int updateCart(Cart cart);
	
	int deleteCart(int cartNo);
}
