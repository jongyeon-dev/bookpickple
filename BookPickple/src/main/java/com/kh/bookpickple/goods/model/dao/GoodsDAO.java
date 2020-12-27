package com.kh.bookpickple.goods.model.dao;

import java.util.List;
import java.util.Map;

public interface GoodsDAO {

	public List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type);
	
	public int selectBookTotalContents(String type);
}
