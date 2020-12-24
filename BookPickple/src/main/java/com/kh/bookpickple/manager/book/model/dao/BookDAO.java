package com.kh.bookpickple.manager.book.model.dao;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface BookDAO {
	
	int insertBook(Book book);
	
	int insertBookImages(BookImages bookImages);

}
