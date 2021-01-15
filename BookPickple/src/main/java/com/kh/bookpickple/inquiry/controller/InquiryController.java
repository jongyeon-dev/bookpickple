package com.kh.bookpickple.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.inquiry.model.service.InquiryService;
import com.kh.bookpickple.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	@RequestMapping("/inquiry/inquiryListView.do")
	public String inquiryListView(@RequestParam int userNo, 
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,Model model) {
		
		int numPerPage = 10;
		List<Inquiry> myInquiryList = inquiryService.selectInquiryList(cPage, numPerPage, userNo);
		int totalContents = inquiryService.selectInquiryTotalContents(userNo);
		String pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "inquiryListView.do?userNo=" + userNo);
		
		model.addAttribute("myInquiryList", myInquiryList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/inquiry/inquiryList";
	}
	
	@RequestMapping("/inquiry/insertInquiryView.do")
	public String insertInquiryView() {
		return "mypage/inquiry/insertInquiry";
	}
	
	@RequestMapping("/inquiry/insertInquiryEnd.do")
	@ResponseBody
	public String insertInquiry(Inquiry inquiry) {
		int result = inquiryService.insertInquiry(inquiry);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("/inquiry/inquiryDetail.do")
	public String inquiryDetail(@RequestParam int userNo, @RequestParam int inquiryNo, Model model) {
		Inquiry inquiry = new Inquiry();
		inquiry.setUserNo(userNo);
		inquiry.setInquiryNo(inquiryNo);
		
		Inquiry inquiryDetail = inquiryService.selectOneInquiry(inquiry);
		model.addAttribute("inquiryDetail", inquiryDetail);
		
		return "mypage/inquiry/inquiryDetail";
	}
	
	@RequestMapping("/inquiry/inquiryAllDetail.do")
	public String inquiryAllDetail(Inquiry inquiry, @RequestParam int inquiryNo, @RequestParam int refNo, Model model) {
		inquiry.setInquiryNo(inquiryNo);
		inquiry.setRefNo(inquiryNo);
		
		List<Inquiry> inquiryAllDetail = inquiryService.selectOneInquriyList(inquiry);
		model.addAttribute("inquiryAllDetail", inquiryAllDetail);
		
		return "mypage/inquiry/inquiryAllDetail";
	}
}
