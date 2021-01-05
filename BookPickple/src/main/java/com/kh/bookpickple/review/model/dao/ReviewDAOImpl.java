package com.kh.bookpickple.review.model.dao;

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

}
