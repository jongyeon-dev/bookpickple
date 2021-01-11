package com.kh.bookpickple.manager.main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.main.model.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	
	@RequestMapping("/manager/managerMain.do")
	public String managerMain(Model model) throws JsonProcessingException {
		List<Map<String, Integer>> dailyJoin = mainService.getDailyJoin();
		ObjectMapper dailyJoinMapper = new ObjectMapper();
		String dailyJoinData = dailyJoinMapper.writeValueAsString(dailyJoin);
		
		int menCount = mainService.getMenCount();
		int womenCount = mainService.getWomenCount();

		List<Object> salesRatio = mainService.getSalesRatio();
		ObjectMapper salesRatioMapper = new ObjectMapper();
		String salesRatioData = salesRatioMapper.writeValueAsString(salesRatio);

		List<Object> ageCount = mainService.getAgeCount();
		ObjectMapper ageCountMapper = new ObjectMapper();
		String ageCountData = ageCountMapper.writeValueAsString(ageCount);

		model.addAttribute("dailyJoin", dailyJoinData);
		model.addAttribute("menCount", menCount);
		model.addAttribute("womenCount", womenCount);
		model.addAttribute("salesRatio", salesRatioData);
		model.addAttribute("ageCount",  ageCountData);
		
		return "manager/main";
	}
}
