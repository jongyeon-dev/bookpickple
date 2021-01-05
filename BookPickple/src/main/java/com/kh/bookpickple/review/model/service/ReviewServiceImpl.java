package com.kh.bookpickple.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.dao.ReviewDAO;
import com.kh.bookpickple.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public OrderDetail oneOrder(int orderNum) {
		return reviewDAO.oneOrder(orderNum);
	}

	@Override
	public int insertReview(Review review) {
		return reviewDAO.insertReivew(review);
	}

	@Override
	public List<String> isExistReview(List<Review> reviewList) {
		List<String> checkReview = new ArrayList<>();
		
		for(int i = 0; i < reviewList.size(); i++) {
			String check = reviewDAO.isExistReview(reviewList.get(i));
			checkReview.add(check);
		}

		return checkReview;
	}

	@Override
	public List<Review> selectOneBookReivewList(int cPage, int numPerPage, int bookNo) {
		return reviewDAO.selectOneBookReivewList(cPage, numPerPage, bookNo);
	}

	@Override
	public int totalReviewContents(int bookNo) {
		return reviewDAO.totalReviewContents(bookNo);
	}

	@Override
	public double oneBookAvgRating(int bookNo) {
		return reviewDAO.oneBookAvgRating(bookNo);
	}

	@Override
	public int oneBookReviewCount(int bookNo) {
		return reviewDAO.oneBookReviewCount(bookNo);
	}

}
