package com.kh.bookpickple.manager.book.model.dao;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, String>> selectBookList() {
		return sqlSession.selectList("bookMapper.selectBookList");
	}

	@Override
	public int insertBook(Book book) {
		return sqlSession.insert("bookMapper.insertBook", book);
		// return book.getBookNo();
	}

	@Override
	public int insertBookImages(BookImages bookImages) {
		return sqlSession.insert("bookMapper.insertBookImages", bookImages);
	}

	@Override
	public Book selectOneBook(int bookNo) {
		return sqlSession.selectOne("bookMapper.selectOneBook", bookNo);
	}
	
	@Override
	public List<BookImages> selectOneBookImagesList(int bookNo) {
		return sqlSession.selectList("bookMapper.selectOneBookImages", bookNo);
	}

	@Override
	public int updateBook(Book book) {
		return sqlSession.update("bookMapper.updateBook", book);
	}

	@Override
	public int updateBookImages(BookImages bookImages) {
		return sqlSession.insert("bookMapper.updateBookImages", bookImages);
	}

	@Override
	public int deleteBook(int bookNo) {
		return sqlSession.update("bookMapper.deleteBook", bookNo);
	}

	@Override
	public int realDeleteBookImages(int bookNo) {
		return sqlSession.update("bookMapper.realDeleteBookImages", bookNo);
	}

	@Override
	public int deleteBookImages(int bookNo) {
		return sqlSession.update("bookMapper.deleteBookImages", bookNo);
	}

}
