package com.school.library.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class BadRequestExpection extends RuntimeException {

	private String message;
	
	public BadRequestExpection(String message) {
		this.message = message;
	}
	
}
