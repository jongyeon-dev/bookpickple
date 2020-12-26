package com.kh.bookpickple.manager.book.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, String>> selectBookList() {
		return bookDAO.selectBookList();
	}


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


	@Override
	public Book selectOneBook(int bookNo) {
		Book book = bookDAO.selectOneBook(bookNo);  //X
		return book;
	}
	
	
	@Override
	public List<BookImages> selectOneBookImagesList(int bookNo) {
		return bookDAO.selectOneBookImagesList(bookNo); //
	}
	
	@Override
	public Book updateBookView(int bookNo) {
		return bookDAO.selectOneBook(bookNo);
	}
	
	@Override
	public int updateBook(Book book, List<BookImages> bookImages) {
		int totalResult = 0;
		
		List<BookImages> originBookImages = bookDAO.selectOneBookImagesList(book.getBookNo());
		
		totalResult = bookDAO.updateBook(book);
		
		if(totalResult == 0) throw new BookException("도서 수정 실패");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originBookImages.size() > 0 ) {
			totalResult = bookDAO.realDeleteBookImages(book.getBookNo());
			
			if(totalResult == 0) throw new BookException("도서 이미지 삭제 실패");
			
		}

		for(int i = 0; i < bookImages.size(); i++) {
			bookImages.get(i).setFileLevel(i == 0 ? 0 : 1);
			System.out.println("dddddddddddd : " + bookImages.get(i));
			totalResult = bookDAO.updateBookImages(bookImages.get(i));  //insert로 다시 진행
			
			if(totalResult == 0) throw new BookException("도서 이미지 추가 실패");
		}
		
				
		return totalResult;
	}


	@Override
	public int deleteBook(int bookNo) {

		int result1 = bookDAO.deleteBook(bookNo);
		
		if(result1 == 0) throw new BookException();

		int result2 = 0;
		if(result1 > 0) {
			result2 = bookDAO.deleteBookImages(bookNo);
			if(result2 == 0) throw new BookException("도서 이미지 상태 변경 실패");
		}
		
		return result2;
	}

}
