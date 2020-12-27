package com.kh.bookpickple.goods.model.service;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type);
	
	int selectBookTotalContents(String type);
}
