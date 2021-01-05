package com.kh.bookpickple.review.model.dao;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.vo.Review;

public interface ReviewDAO {

	OrderDetail oneOrder(int orderNum);
	
	int insertReivew(Review review);
	
	String isExistReview(Review review);
}
