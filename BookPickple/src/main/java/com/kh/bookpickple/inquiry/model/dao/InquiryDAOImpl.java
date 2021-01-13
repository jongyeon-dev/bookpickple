package com.kh.bookpickple.inquiry.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Inquiry> selectInquiryList(int cPage, int numPerPage, int userNo) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("inquiryMapper.selectInquiryList", userNo, rows);
	}

	@Override
	public int selectInquiryTotalContents() {
		return sqlSession.selectOne("inquiryMapper.selectInquiryTotalContents");
	}

	@Override
	public int insertInquiry(Inquiry inquiry) {
		return sqlSession.insert("inquiryMapper.insertInquiry", inquiry);
	}

	@Override
	public Inquiry selectOneInquiry(Inquiry inquiry) {
		return sqlSession.selectOne("inquiryMapper.selectOneInquiry", inquiry);
	}

}
