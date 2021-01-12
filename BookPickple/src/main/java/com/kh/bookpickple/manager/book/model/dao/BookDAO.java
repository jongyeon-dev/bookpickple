package com.kh.bookpickple.manager.book.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface BookDAO {
	
	List<Map<String, String>> selectBookList(Book book);
	
	int insertBook(Book book);
	
	int insertBookImages(BookImages bookImages);
	
	Book selectOneBook(int bookNo);
	
	List<BookImages> selectOneBookImagesList(int bookNo);
	
	int updateBook(Book book);
	
	int updateBookImages(BookImages bookImages);
	
	int deleteBook(int bookNo);
	
	int realDeleteBookImages(int bookNo);
	
	int deleteBookImages(int bookNo);

}
