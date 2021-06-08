package com.school.library.controller;

import static com.school.library.constants.LibraryConstants.BOOKS_PER_PAGE;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.school.library.config.QueryManager;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.model.CreateUser;
import com.school.library.service.BookService;
import com.school.library.service.UserService;

@Controller
public class HomeController {

    public static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private BookService bookService;

    @Autowired
    UserService userService;
    
	@Autowired
	private QueryManager manger;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/signup")
    public String signup(CreateUser user) {
        userService.createUser(user);
        return "redirect:/login";
    }
     
    @GetMapping("/home")
    public String homeDashboard(@RequestParam(value="keyword",required=false) String keyword, Model model) {
    	if(StringUtils.isNotBlank(keyword)) {
    		 model.addAttribute("books", manger.searchBooks(keyword));
    		 model.addAttribute("keyword", keyword);
    		 return "home";
    	}
    	
        List<BookDetailsEntity> books = new ArrayList<>();
        Page<BookDetailsEntity> pagedResult = bookService.getBooks(0, BOOKS_PER_PAGE);
        if(pagedResult.hasContent()) {
            books = pagedResult.getContent();
        }

        model.addAttribute("books", books);
        model.addAttribute("pageCount", pagedResult.getTotalPages());
        return "home";
    }
    
}
