package com.kh.bookpickple.manager.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertBook(Book book) {
		return sqlSession.insert("bookMapper.insertBook", book);
		// return book.getBookNo();
	}

	@Override
	public int insertBookImages(BookImages bookImages) {
		return sqlSession.insert("bookMapper.insertBookImages", bookImages);
	}

}
