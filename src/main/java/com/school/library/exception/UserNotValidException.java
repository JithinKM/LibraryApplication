package com.school.library.exception;

public class UserNotValidException extends RuntimeException {

	private String message;
	private String status;
	
	public UserNotValidException(String status, String message) {
		this.status = status;
		this.message = message;
	}
	
}
