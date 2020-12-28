package com.kh.bookpickple.goods.model.service;

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

}
