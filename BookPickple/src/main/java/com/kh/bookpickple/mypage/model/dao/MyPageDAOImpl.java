package com.kh.bookpickple.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.order.model.vo.Order;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Order> selectOrderList(int cPage, int numPerPage, int userNo) {
		return sqlSession.selectList("myPageMapper.selectOrderList", userNo);
	}

	@Override
	public int selectOrderTotalContents() {
		return sqlSession.selectOne("myPageMapper.selectOrderTotalContents");
	}

	@Override
	public List<Order> selectOrderDetailList(Order order) {
		return sqlSession.selectList("myPageMapper.selectOrderDetailList", order);
	}

}
