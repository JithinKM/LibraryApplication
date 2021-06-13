package com.school.library.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.school.library.service.BookService;

@Controller
public class HomeController {

	public static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Value("${book.visible.order}")
	private String visibleOrder;

	@Autowired
	private BookService bookService;

	@GetMapping("/")
	public String home() {
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String homePage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		if (StringUtils.isNotBlank(keyword)) {
			model.addAttribute("books", bookService.searchBookDetails(keyword));
			model.addAttribute("keyword", keyword);
			return "home";
		}

		model.addAttribute("books", bookService.getDefaultBooks(visibleOrder));
		return "home";
	}

}
