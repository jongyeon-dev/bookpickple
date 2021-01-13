package com.kh.bookpickple.inquiry.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Inquiry implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1010L;
	
	private int inquiryNo;
	private int userNo;
	private String type;
	private String title;
	private String content;
	private Date creDate;
	private String status;
	private int refNo;
	private int clevel;
	
	// 추가 필드
	private String userId; // 매니저가 문의 조회 시
	private String periodFrom; // 기간 검색 시
	private String periodTo; // 기간 검색 시
	private String searchType; // 검색 시 사용
	private String searchKeyword; // 검색 시 사용
}
