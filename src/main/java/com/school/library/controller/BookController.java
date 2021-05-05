package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.library.model.Book;
import com.school.library.service.BookService;

import static com.school.library.constants.LibraryConstants.BOOKS_PER_PAGE;

@Controller
@RequestMapping("/book")
public class BookController {
	
	public static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookService bookService;

	@GetMapping
	public String getBooksListPage(Model model) {
		model.addAttribute("books", bookService.getBooks(0, BOOKS_PER_PAGE));
		return "books-list";
	}

	@PostMapping
	public String createBooks(Book book) {
		bookService.createBooks(book);
		return "redirect:/book";
	}

}
