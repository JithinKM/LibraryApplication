package com.school.library.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class InternalServerExpection extends RuntimeException {

	private String message;
	
	public InternalServerExpection(String message) {
		this.message = message;
	}
	
}
