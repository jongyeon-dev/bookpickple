package com.kh.bookpickple.cart.model.vo;

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
public class Cart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1004L;
	private int bookNo;
	private int userNo;
	private int cartNo;
	private int quantity;
	private Date creDate;
	
}
