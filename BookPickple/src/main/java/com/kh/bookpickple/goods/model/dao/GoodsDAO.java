package com.kh.bookpickple.goods.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface GoodsDAO {
	
	/**
	 * 메인 신간 조회
	 * @return
	 */
	List<Book> selectMainNewBookList();
	
	List<Book> selectMainBestBookList();
	
	List<Book> selectMainSteadyBookList();

	List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type);
	
	int selectBookTotalContents(String type);
	
	Book selectOneBook(int bookNo);
	
	List<BookImages> selectOneBookImagesList(int bookNo);
	
	Book selectQuickBook(int bookNo);
}
