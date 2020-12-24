package com.kh.bookpickple.manager.book.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.common.exception.BookException;
import com.kh.bookpickple.manager.book.model.dao.BookDAO;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDAO bookDAO;

	@Override
	public int insertBook(Book book, List<BookImages> bookImages) {
		int result1 = bookDAO.insertBook(book);
		
		if(result1 == 0) throw new BookException();

		int result2 = 0;
		
		for(int i = 0; i < bookImages.size(); i++) {
			bookImages.get(i).setFileLevel(i == 0 ? 0 : 1);
			result2 = bookDAO.insertBookImages(bookImages.get(i));
			
			if(result2 == 0) throw new BookException("도서 이미지 추가 실패");
		}
		
		return result1;
	}

}
