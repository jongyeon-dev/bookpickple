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
	
	private String orderNum;
	//private String orderNo;
	private int userNo;
	private int bookNo;
	private String orderTitle;
	private String ordererName;
	private int totalQuantity;
	private int totalPrice;
	private int totalPoint;
	private String receiverName;
	private String receiverEmail;
	private String receiverTel;
	private String deliveryAddr;
	private String payMethod;
	private Date payDate;
	private String deliveryStatus;
	
	// 추가 필드 -- 주문작성 시 사용(세션)
	// 하기 정보를 세션에서 사용하다 insert시 orderDetail에 넣는다. 
	private String title; 
	private int quantity;
	private int salesPrice;
	private int point;
	private String bookImage;
}
