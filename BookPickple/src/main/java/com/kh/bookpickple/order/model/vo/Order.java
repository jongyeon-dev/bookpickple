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
public class Order implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1005L;
	
	private int orderNum;
	private int orderNo;
	private int userNo;
	private int bookNo;
	private String ordererName;
	private int quantity;
	private int salesPrice;
	private int point;
	private String receiverName;
	private String receiverTel;
	private String deliveryAddr;
	private String deliverymethod;
	private String payMethod;
	private Date payDate;
	private String deliveryStatus;
	
	// 추가 필드 -- 주문작성 시 사용
	private String bookTitle;
	private String bookImage;
}
