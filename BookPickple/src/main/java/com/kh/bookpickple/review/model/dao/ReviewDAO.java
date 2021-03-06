package com.kh.bookpickple.review.model.dao;

import java.util.List;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.vo.Review;

public interface ReviewDAO {

	OrderDetail oneOrder(int orderNum);
	
	int insertReivew(Review review);
	
	String isExistReview(Review review);
	
	Double eachBookReviewCount(Review review);
	
	Double eachBookReviewAvg(Review review);
	
	List<Review> selectOneBookReivewList(int cPage, int numPerPage, int bookNo);
	
	int totalReviewContents(int bookNo);
	
	double oneBookAvgRating(int bookNo);
	
	int oneBookReviewCount(int bookNo);
}
