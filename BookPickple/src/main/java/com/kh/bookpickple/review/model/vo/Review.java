package com.kh.bookpickple.review.model.vo;

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
public class Review implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1007L;
	
	private int reviewNo;
	private int orderNum;
	private int orderNo;
	private int userNo;
	private int bookNo;
	private String content;
	private int rating;
	private Date creDate;
	
	// 추가 필드
	private String type; // 도서 목록 조회 -> 도서 개별 리뷰 조회 시 사용
	private String userId; // 도서 상세조회 리뷰 조회 시 사용
	
}
