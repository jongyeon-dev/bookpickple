package com.kh.bookpickple.common.exception;

public class OrderException extends Exception {

	public OrderException() { }
	
	public OrderException(String message) {
		super("주문/결제 에러 : " + message);
	}
}
