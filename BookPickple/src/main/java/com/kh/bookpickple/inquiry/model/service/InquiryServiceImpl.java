package com.kh.bookpickple.inquiry.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.inquiry.model.dao.InquiryDAO;
import com.kh.bookpickple.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	InquiryDAO inquiryDAO;

	@Override
	public List<Inquiry> selectInquiryList(int cPage, int numPerPage, int userNo) {
		return inquiryDAO.selectInquiryList(cPage, numPerPage, userNo);
	}

	@Override
	public int selectInquiryTotalContents() {
		return inquiryDAO.selectInquiryTotalContents();
	}

	@Override
	public int insertInquiry(Inquiry inquiry) {
		return inquiryDAO.insertInquiry(inquiry);
	}

	@Override
	public Inquiry selectOneInquiry(Inquiry inquiry) {
		return inquiryDAO.selectOneInquiry(inquiry);
	}

	@Override
	public List<Inquiry> selectOneInquriyList(Inquiry inquiry) {
		return inquiryDAO.selectOneInquriyList(inquiry);
	}

}
