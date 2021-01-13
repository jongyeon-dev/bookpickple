package com.kh.bookpickple.manager.inquiry.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;
import com.kh.bookpickple.manager.inquiry.model.dao.AnswerDAO;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	AnswerDAO answerDAO;

	@Override
	public List<Inquiry> selectInquiryList(Inquiry inquiry) {
		return answerDAO.selectInquiryList(inquiry);
	}

	@Override
	public Inquiry selectOneInquiry(int inquiryNo) {
		return answerDAO.selectOneInquiry(inquiryNo);
	}

	@Override
	public int insertAnswer(Inquiry inquiry) {
		return answerDAO.insertAnswer(inquiry);
	}

	@Override
	public int updateInquiryStatus(int inquiryNo) {
		return answerDAO.updateInquiryStatus(inquiryNo);
	}

	
	

}
