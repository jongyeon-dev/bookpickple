package com.kh.bookpickple.manager.book.model.vo;

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
public class BookImages implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1003L;
	
	private int imageNo;
	private int bookNo;
	private String originFileName;
	private String changeFileName;
	private Date creDate;
	private int fileLevel;
	private String status;
}
