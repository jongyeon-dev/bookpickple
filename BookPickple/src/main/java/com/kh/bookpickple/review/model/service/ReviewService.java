package com.kh.bookpickple.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.vo.Review;

public interface ReviewService {

	OrderDetail oneOrder(int orderNum);
	
	int insertReview(Review review);
	
	List<String> isExistReview(List<Review> reviewList);
	
	Map<String, Double> eachBookReview(Review review);
	
	List<Review> selectOneBookReivewList(int cPage, int numPerPage, int bookNo);
	
	int totalReviewContents(int bookNo);
	
	double oneBookAvgRating(int bookNo);
	
	int oneBookReviewCount(int bookNo);
}
