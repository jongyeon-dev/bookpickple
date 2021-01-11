package com.kh.bookpickple.manager.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.manager.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	@Override
	public List<Map<String, Integer>> getDailyJoin() {
		return mainDAO.getDailyJoin();
	}

	@Override
	public int getMenCount() {
		return mainDAO.getMenCount();
	}

	@Override
	public int getWomenCount() {
		return mainDAO.getWomenCount();
	}

	@Override
	public List<Object> getSalesRatio() {
		return mainDAO.getSalesRatio();
	}

	@Override
	public List<Object> getAgeCount() {
		return mainDAO.getAgeCount();
	}

}
