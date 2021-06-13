package com.school.library.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class NotFoundExpection extends RuntimeException {

	private String message;
	
	public NotFoundExpection(String message) {
		this.message = message;
	}
	
}
