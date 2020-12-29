package com.kh.bookpickple.cart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.cart.model.vo.Cart;
import com.kh.bookpickple.manager.book.model.vo.Book;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public boolean findCart(Cart cart) {
		String result = sqlSession.selectOne("cartMapper.findCart", cart);
		System.out.println(result);
		return Boolean.parseBoolean(result);
	}

	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}

	@Override
	public List<Cart> selectCartList(Cart cart) {
		List<Cart> cartList = sqlSession.selectList("cartMapper.selectCartList", cart);
		return cartList;
	}

	@Override
	public List<Book> selectBookList(List<Cart> cartList) {
		List<Book> bookList = sqlSession.selectList("cartMapper.selectBookList", cartList);
		return bookList;
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
