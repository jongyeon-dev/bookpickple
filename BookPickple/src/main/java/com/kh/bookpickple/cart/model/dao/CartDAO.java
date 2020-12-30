package com.kh.bookpickple.cart.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.cart.model.vo.Cart;
import com.kh.bookpickple.manager.book.model.vo.Book;

public interface CartDAO {

	boolean findCart(Cart cart);
	
	int insertCart(Cart cart);
	
	public List<Cart> selectCartList(Cart cart);
	
	public List<Book> selectBookList(Cart cart);

	int updateCart(Cart cart);
	
	int deleteCart(int cartNo);

}
