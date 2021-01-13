package com.kh.bookpickple.manager.inquiry.model.service;

import java.util.List;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;

public interface AnswerService {

	List<Inquiry> selectInquiryList(Inquiry inquiry);
	
	Inquiry selectOneInquiry(int inquiryNo);
	
	int insertAnswer(Inquiry inquiry);
	
	int updateInquiryStatus(int inquiryNo);
}
