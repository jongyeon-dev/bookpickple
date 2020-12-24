package com.kh.bookpickple.manager.book.model.service;

import java.util.List;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface BookService {

	int insertBook(Book book, List<BookImages> bookImages);
	
}
