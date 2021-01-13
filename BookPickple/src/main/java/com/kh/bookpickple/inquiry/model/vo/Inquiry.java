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
	private int level;
}
