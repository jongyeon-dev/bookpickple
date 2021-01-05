package com.kh.bookpickple.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.service.ReviewService;
import com.kh.bookpickple.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/review/insertReviewView.do")
	public String insertReviewView(@RequestParam int orderNum, Model model) {
		OrderDetail oneOrder = reviewService.oneOrder(orderNum);
		model.addAttribute("oneOrder", oneOrder);
		return "mypage/review/insertReview";
	}
	
	@RequestMapping("/review/insertReview.do")
	@ResponseBody 
	public String insertReview(Review review, Model model) {
		int result = reviewService.insertReview(review);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
}
