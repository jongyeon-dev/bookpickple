package com.kh.bookpickple.goods.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.goods.model.dao.GoodsDAO;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	GoodsDAO goodsDAO;
	
	@Override
	public Map<String, List<Book>> selectMainBooksList() {
		Map<String, List<Book>> mainBooksMap = new HashMap<String, List<Book>>();
		
		List<Book> mainBooksList = goodsDAO.selectMainNewBookList();
		mainBooksMap.put("newBooksList", mainBooksList);
		
		mainBooksList = goodsDAO.selectMainBestBookList();
		mainBooksMap.put("bestBooksList", mainBooksList);
		
		mainBooksList = goodsDAO.selectMainSteadyBookList();
		mainBooksMap.put("steadyBooksList", mainBooksList);
		
		return mainBooksMap;
	}

	@Override
	public List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type) {
		return goodsDAO.selectBookList(cPage, numPerPage, type);
	}

	@Override
	public int selectBookTotalContents(String type) {
		return goodsDAO.selectBookTotalContents(type);
	}

	@Override
	public Book selectOneBook(int bookNo) {
		return goodsDAO.selectOneBook(bookNo);
	}

	@Override
	public List<BookImages> selectOneBookImagesList(int bookNo) {
		return goodsDAO.selectOneBookImagesList(bookNo);
	}

	@Override
	public Book selectQuickBook(int bookNo) {
		return goodsDAO.selectQuickBook(bookNo);
	}

	@Override
	public List<String> selectAjaxKeywordSeach(String keyword) {
		List<String> ajaxKeywordSearch = goodsDAO.selectAjaxKeywordSeach(keyword);
		return ajaxKeywordSearch;
	}

	@Override
	public List<Map<String, String>> selectSearchBookList(int cPage, int numPerPage, String keyword) {
		return goodsDAO.selectSearchBookList(cPage, numPerPage, keyword);
	}

	@Override
	public int selectSearchBookTotalContents(String keyword) {
		return goodsDAO.selectSearchBookTotalContents(keyword);
	}

}
