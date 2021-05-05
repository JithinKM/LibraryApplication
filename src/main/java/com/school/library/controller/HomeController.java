package com.school.library.controller;

import com.school.library.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import static com.school.library.constants.LibraryConstants.BOOKS_PER_PAGE;

@Controller
public class HomeController {

    public static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private BookService bookService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    
    @GetMapping("/")
    public String homeDashboard(Model model) {
        model.addAttribute("books", bookService.getBooks(0, BOOKS_PER_PAGE));
        return "home";
    }
    
    @GetMapping("/admin")
    public String adminDashboard() {
        return "admin-dashboard";
    }
}
