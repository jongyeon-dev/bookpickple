package com.kh.bookpickple.manager.book.model.vo;

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
public class Book {
	private int bookNo;
	private int bookType;
	private String title;
	private String writer;
	private String publisher;
	private int price;
	private int salesPrice;
	private int point;
	private String publishedDate;
	private String isbn;
	private int deliveryPrice;
	private String bookIntro;
	private String writerIntro;
	private Date creDate;
	private String status;
}