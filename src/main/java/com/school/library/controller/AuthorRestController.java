package com.school.library.controller;

import com.school.library.entity.AuthorEntity;
import com.school.library.service.AuthorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/author")
public class AuthorRestController {

	public static final Logger logger = LoggerFactory.getLogger(AuthorRestController.class);

	@Autowired
	private AuthorService authorService;

	@GetMapping("/all")
	public List<AuthorEntity> getAllAuthors() {
		return authorService.getAuthors();
	}

}
