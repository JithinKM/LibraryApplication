package com.school.library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.service.AuthorService;
import com.school.library.service.BookService;
import com.school.library.service.DashboardService;

@RestController
public class CommonRestController {

	public static final Logger logger = LoggerFactory.getLogger(CommonRestController.class);

	@Autowired
	private AuthorService authorService;
	
	@Autowired
	private DashboardService dashboardService;
	
	@Autowired
	private BookService bookService;

	@GetMapping("/user/names")
	public List<String> getAllRegisteredUserNames(@RequestParam int page, @RequestParam int size) {
		return dashboardService.getAllRegisteredUserNames();
	}

	@GetMapping("/author/all")
	public List<AuthorEntity> getAllAuthors() {
		return authorService.getDefaultAuthors();
	}

	@GetMapping("/book/all")
	public List<BookDetailsEntity> getAllBooks() {
		return bookService.getAllBooks();
	}
	
}
