package com.kh.bookpickple.order.model.vo;

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
public class OrderDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1006L;
	
	private int orderNo;
	private String orderNum;
	private int bookNo;
	private String title;
	private int salesPrice;
	private int quantity;
	private int point;

}
