package com.kh.bookpickple.goods.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

public interface GoodsService {

	List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type);
	
	int selectBookTotalContents(String type);
	
	Book selectOneBook(int bookNo);
	
	List<BookImages> selectOneBookImagesList(int bookNo);
	
	Book selectQuickBook(int BookNo);
}
