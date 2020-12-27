package com.kh.bookpickple.goods.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.goods.model.dao.GoodsDAO;

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

}
