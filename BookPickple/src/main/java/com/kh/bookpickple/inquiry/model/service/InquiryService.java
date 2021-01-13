package com.kh.bookpickple.inquiry.model.service;

import java.util.List;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;
import com.kh.bookpickple.member.model.vo.Member;

public interface InquiryService {

	List<Inquiry> selectInquiryList(int cPage, int numPerPage, int userNo);
	
	int selectInquiryTotalContents();
	
	int insertInquiry(Inquiry inquiry);
	
	Inquiry selectOneInquiry(Inquiry inquiry);
}
