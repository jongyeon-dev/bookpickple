package com.kh.bookpickple.cart.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.cart.model.dao.CartDAO;
import com.kh.bookpickple.cart.model.vo.Cart;
import com.kh.bookpickple.manager.book.model.vo.Book;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO cartDAO;

	@Override
	public boolean findCart(Cart cart) {
		return cartDAO.findCart(cart);
	}

	@Override
	public int insertCart(Cart cart) {
		return cartDAO.insertCart(cart);
	}

	@Override
	public Map<String, List> selectCartList(Cart cart) {
		
		Map<String, List> cartMap = new HashMap<String, List>();
		
		List<Cart> cartList = cartDAO.selectCartList(cart);
		
		if(cartList.size() == 0) {
			return null;
		}
		
		List<Book> bookList = cartDAO.selectBookList(cartList);
		
		cartMap.put("cartList", cartList);
		cartMap.put("bookList", bookList);
		
		return cartMap;
	}

	@Override
	public int updateCart(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
