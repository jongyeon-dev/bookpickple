package com.kh.bookpickple.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public OrderDetail oneOrder(int orderNum) {
		return sqlSession.selectOne("reviewMapper.selectOneOrder", orderNum);
	}

	@Override
	public int insertReivew(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	@Override
	public String isExistReview(Review review) {
		return sqlSession.selectOne("reviewMapper.isExistReview", review);
	}
	
	@Override
	public Double eachBookReviewCount(Review review) {
		Double count = sqlSession.selectOne("reviewMapper.eachBookReviewCount", review);
		return count;
	}

	@Override
	public Double eachBookReviewAvg(Review review) {
		Double avg = sqlSession.selectOne("reviewMapper.eachBookReviewAvg", review);
		return avg;
	}
	
	@Override
	public List<Review> selectOneBookReivewList(int cPage, int numPerPage, int bookNo) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("reviewMapper.selectOneBookReivewList", bookNo, rows);
	}

	@Override
	public int totalReviewContents(int bookNo) {
		return sqlSession.selectOne("reviewMapper.selectBookTotalContents", bookNo);
	}

	@Override
	public double oneBookAvgRating(int bookNo) {
		return sqlSession.selectOne("reviewMapper.oneBookAvgRating", bookNo);
	}

	@Override
	public int oneBookReviewCount(int bookNo) {
		return sqlSession.selectOne("reviewMapper.oneBookReviewCount", bookNo);
	}

}
