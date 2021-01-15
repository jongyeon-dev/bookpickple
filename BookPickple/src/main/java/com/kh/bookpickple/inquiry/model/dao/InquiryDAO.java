package com.kh.bookpickple.inquiry.model.dao;

import java.util.List;

import com.kh.bookpickple.inquiry.model.vo.Inquiry;

public interface InquiryDAO {

	List<Inquiry> selectInquiryList(int cPage, int numPerPage, int userNo);
	
	int selectInquiryTotalContents(int userNo);
	
	int insertInquiry(Inquiry inquiry);
	
	Inquiry selectOneInquiry(Inquiry inquiry);
	
	List<Inquiry> selectOneInquriyList(Inquiry inquiry);
}
