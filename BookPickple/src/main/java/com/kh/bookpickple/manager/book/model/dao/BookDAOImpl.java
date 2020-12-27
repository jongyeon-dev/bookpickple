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
		return sqlSession.selectList("managerBookMapper.selectBookList");
	}

	@Override
	public int insertBook(Book book) {
		return sqlSession.insert("managerBookMapper.insertBook", book);
	}

	@Override
	public int insertBookImages(BookImages bookImages) {
		return sqlSession.insert("managerBookMapper.insertBookImages", bookImages);
	}

	@Override
	public Book selectOneBook(int bookNo) {
		return sqlSession.selectOne("managerBookMapper.selectOneBook", bookNo);
	}
	
	@Override
	public List<BookImages> selectOneBookImagesList(int bookNo) {
		return sqlSession.selectList("managerBookMapper.selectOneBookImages", bookNo);
	}

	@Override
	public int updateBook(Book book) {
		return sqlSession.update("managerBookMapper.updateBook", book);
	}

	@Override
	public int updateBookImages(BookImages bookImages) {
		return sqlSession.insert("managerBookMapper.updateBookImages", bookImages);
	}

	@Override
	public int deleteBook(int bookNo) {
		return sqlSession.update("managerBookMapper.deleteBook", bookNo);
	}

	@Override
	public int realDeleteBookImages(int bookNo) {
		return sqlSession.update("managerBookMapper.realDeleteBookImages", bookNo);
	}

	@Override
	public int deleteBookImages(int bookNo) {
		return sqlSession.update("managerBookMapper.deleteBookImages", bookNo);
	}

}
