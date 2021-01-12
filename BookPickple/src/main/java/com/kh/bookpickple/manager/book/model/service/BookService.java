package com.kh.bookpickple.manager.book.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface BookService {

	List<Map<String, String>> selectBookList(Book book);
	
	int insertBook(Book book, List<BookImages> bookImages);
	
	Book selectOneBook(int bookNo);
	
	List<BookImages> selectOneBookImagesList(int bookNo);
	
	Book updateBookView(int bookNo);
	
	int updateBook(Book book, List<BookImages> bookImages);
	
	int deleteBook(int bookNo);
	
}
