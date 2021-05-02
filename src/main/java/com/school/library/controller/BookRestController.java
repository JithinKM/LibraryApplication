package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.school.library.config.UserPrincipal;
import com.school.library.service.BookService;

@RestController
@RequestMapping("/book")
public class BookRestController {
	
	public static final Logger logger = LoggerFactory.getLogger(BookRestController.class);

	@Autowired
	private BookService bookService;
	
	//change to delete after sometime
	//do it from js with popup
	@GetMapping("/delete/{id}")
	public String deleteBook(@PathVariable String id) {
		bookService.deleteBook(id);
		return "redirect:/book";
	}
	
	//do it from js with popup
	@GetMapping("/block")
	public String blockBook(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String id) {
		String username = userPrincipal.getUsername();
		//check number of currently borrowed books of user. if it is greater than x dont allow
		//check book in between blocked by any user[available quantity].  or direct attempt handle error
		//create colum in table for blocked/borrowedtime, extension request, assigned by...
		return "json Object";
	}
	
	//do it from js with popup
	@GetMapping("/renew")
	public String renewBook(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String id) {
		String username = userPrincipal.getUsername();
		//check number of currently borrowed books of user. if it is greater than x dont allow
		//check book in between blocked by any user[available quantity].  or direct attempt handle error
		//create colum in table for blocked/borrowedtime, extension request, assigned by...
		return "json Object";
	}
	
	//do it from js with popup
	@GetMapping("/renew/approve")
	public String approveRenewlBook(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String id) {
		String username = userPrincipal.getUsername();
		//check number of currently borrowed books of user. if it is greater than x dont allow
		//check book in between blocked by any user[available quantity].  or direct attempt handle error
		//create colum in table for blocked/borrowedtime, extension request, assigned by...
		return "json Object";
	}
	
	//do it from js with popup
	@PostMapping("/assign")
	public String assignBook(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String id) {
		String assignedByUsername = userPrincipal.getUsername();
		//check bookstill available?
		
		//check number of currently borrowed books of user. if it is greater than x dont allow
		//check book in between blocked by any use]r[available quantity.  or direct attempt handle error
		//create colum in table for blocked/borrowedtime, extension request, assigned by...
		return "json Object";
	}
	
	//do it from js with popup
	@PostMapping("/return")
	public String returnBook(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String id) {
		String assignedByUsername = userPrincipal.getUsername();
		//check bookstill available?
		
		//check number of currently borrowed books of user. if it is greater than x dont allow
		//check book in between blocked by any use]r[available quantity.  or direct attempt handle error
		//create colum in table for blocked/borrowedtime, extension request, assigned by...
		return "json Object";
	}

}
