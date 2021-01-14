package com.kh.bookpickple.manager.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;
import com.kh.bookpickple.manager.inquiry.model.service.AnswerService;

@Controller
public class AnswerController {
	
	@Autowired
	AnswerService answerService;
	
	@RequestMapping("/manager/inquiryListView.do")
	public String inquiryListView(@RequestParam(value="periodFrom", required=false) String periodFrom,
			@RequestParam(value="periodTo", required=false) String periodTo,
			@RequestParam(value="searchType", required=false) String searchType,
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,
			Model model) {
		
		Inquiry inquiry = new Inquiry();
		inquiry.setPeriodFrom(periodFrom);
		inquiry.setPeriodTo(periodTo);
		inquiry.setSearchType(searchType);
		inquiry.setSearchKeyword(searchKeyword);
		
		List<Inquiry> inquiryList = answerService.selectInquiryList(inquiry);
		model.addAttribute("inquiryList", inquiryList);
		
		return "manager/inquiry/inquiryList";
		
	}
	
	@RequestMapping("/manager/inquiryDetail.do")
	public String inquiryDetail(@RequestParam int inquiryNo, Model model) {
		Inquiry inquiryDetail = answerService.selectOneInquiry(inquiryNo);
		model.addAttribute("inquiryDetail", inquiryDetail);
		return "manager/inquiry/inquiryDetail";
	}
	
	@RequestMapping("/manager/insertAnswerEnd.do")
	@ResponseBody
	public String insertAnswer(@RequestParam int inquiryNo, Inquiry inquiry) {
		int result = answerService.insertAnswer(inquiry);
		int updateStatus = answerService.updateInquiryStatus(inquiryNo);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}

}
