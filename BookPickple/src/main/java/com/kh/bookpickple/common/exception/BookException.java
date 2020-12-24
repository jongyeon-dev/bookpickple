package com.kh.bookpickple.common.exception;

public class BookException extends RuntimeException {
	
public BookException() { }
	
	public BookException(String message) {
		super("도서 에러 : " + message);
	}

}
