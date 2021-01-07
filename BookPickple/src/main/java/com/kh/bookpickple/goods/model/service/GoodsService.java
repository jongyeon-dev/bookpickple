package com.kh.bookpickple.goods.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface GoodsService {
	
	/**
	 * 신간, 베스트셀러, 화제의 책을 List에 담아 Map으로 합치는 메소드
	 * @return
	 */
	Map<String,List<Book>> selectMainBooksList();

	List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type);
	
	int selectBookTotalContents(String type);
	
	Book selectOneBook(int bookNo);
	
	List<BookImages> selectOneBookImagesList(int bookNo);
	
	Book selectQuickBook(int BookNo);
}
