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
	
	private int orderNum;
	private int orderNo;
	private int bookNo;
	private String title;
	private int salesPrice;
	private int quantity;
	private int point;
	
	// 추가 필드
	private int userNo;

}
