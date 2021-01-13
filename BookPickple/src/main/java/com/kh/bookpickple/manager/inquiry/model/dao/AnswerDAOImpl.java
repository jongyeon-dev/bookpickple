package com.kh.bookpickple.manager.inquiry.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Inquiry> selectInquiryList(Inquiry inquiry) {
		return sqlSession.selectList("answerMapper.selectInquiryList", inquiry);
	}

	@Override
	public Inquiry selectOneInquiry(int inquiryNo) {
		return sqlSession.selectOne("answerMapper.selectOneInquiry", inquiryNo);
	}

	@Override
	public int insertAnswer(Inquiry inquiry) {
		return sqlSession.insert("answerMapper.insertAnswer", inquiry);
	}

	@Override
	public int updateInquiryStatus(int inquiryNo) {
		return sqlSession.update("answerMapper.updateInquiryStatus", inquiryNo);
	}

}
