package com.kh.bookpickple.cart.model.dao;

import java.util.List;

import com.kh.bookpickple.cart.model.vo.Cart;
import com.kh.bookpickple.manager.book.model.vo.Book;

public interface CartDAO {

	boolean findCart(Cart cart);
	
	int insertCart(Cart cart);
	
	public List<Cart> selectCartList(Cart cart);
	
	public List<Book> selectBookList(List<Cart> cartList);

	int updateCart(Cart cart);
	
	int deleteCart(int cartNo);
}
