package com.kh.bookpickple.manager.main.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.manager.book.model.vo.Book;

public interface MainDAO {
	
	List<Map<String, Integer>> getDailyJoin();

	int getMenCount();
	
	int getWomenCount();
	
	List<Object> getSalesRatio();
	
	List<Object> getAgeCount();
}
