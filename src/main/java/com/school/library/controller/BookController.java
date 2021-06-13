package com.school.library.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.library.config.UserPrincipal;
import com.school.library.entity.BookUserEntity;
import com.school.library.exception.Message;
import com.school.library.model.Book;
import com.school.library.service.BookService;
import com.school.library.service.UserService;

@Controller
public class BookController {
	
	public static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Value("${max.allowed.book.count}")
	private int maxBooks;
    
    @Value("${admin.book.visible.order}")
	private String visibleOrder;

	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/book")
	public String getBooksListPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		
		if (StringUtils.isNotBlank(keyword)) {
			model.addAttribute("books", bookService.searchBookDetails(keyword));
			model.addAttribute("keyword", keyword);
			return "books-list";
		}
		
		model.addAttribute("books", bookService.getDefaultBooks(visibleOrder));
		return "books-list";
	}

	@PostMapping("/book")
	public String createBooks(Book book) {
		bookService.createBooks(book);
		return "redirect:/book";
	}
	
	@GetMapping("/book/block/{bookDetailsId}")
	public String blockBook(@AuthenticationPrincipal UserPrincipal userPrincipal,
			@PathVariable("bookDetailsId") Long bookDetailsId, RedirectAttributes redirectAttrs) {
		//need to handle same books different copy is getting assigned
		String username = userPrincipal.getUsername();
		int currentOwnedBooks = userService.getCurrentOwnedBooks(username).size();
		if(currentOwnedBooks >= maxBooks) {
			System.out.println("Maximum number of books are requested/alloted");
			redirectAttrs.addFlashAttribute("message", new Message("danger","Limit Reached", "Maximum number of books are requested/alloted"));
			return "redirect:/home";
		}
		BookUserEntity bookUserEntity = userService.blockBook(bookDetailsId, username);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Blocked Successfully.";
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Blocked", details));
		return "redirect:/home";
	}
	
	@GetMapping("/book/renew/{bookUserId}")
	public String renewBook(@AuthenticationPrincipal UserPrincipal userPrincipal,
			@PathVariable("bookUserId") Long bookUserId, RedirectAttributes redirectAttrs) {
		String username = userPrincipal.getUsername();
		
		BookUserEntity bookUserEntity = userService.renewBook(bookUserId, username);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Renew requested by user " 
		+ bookUserEntity.getUser().getUsername();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Renew Approved", details));
		return "redirect:/user/profile";
	}
	
	@GetMapping("/book/cancel/{bookUserId}")
	public String cancelBookRequest(@AuthenticationPrincipal UserPrincipal userPrincipal,
			@PathVariable("bookUserId") Long bookUserId, RedirectAttributes redirectAttrs) {
		String username = userPrincipal.getUsername();
		
		BookUserEntity bookUserEntity = userService.cancelBookRequest(bookUserId, username);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Cancel requested by user " 
		+ bookUserEntity.getUser().getUsername();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Cancelled", details));
		return "redirect:/user/profile";
	}

}
