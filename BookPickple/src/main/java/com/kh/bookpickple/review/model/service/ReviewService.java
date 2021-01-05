package com.kh.bookpickple.review.model.service;

import java.util.List;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.vo.Review;

public interface ReviewService {

	OrderDetail oneOrder(int orderNum);
	
	int insertReview(Review review);
	
	List<String> isExistReview(List<Review> reviewList);
}
