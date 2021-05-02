package com.school.library.controller;

import com.school.library.entity.BookEntity;
import com.school.library.service.BookDetailService;
import com.school.library.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book-detail")
public class BookDetailController {
    public static final Logger logger = LoggerFactory.getLogger(BookDetailController.class);

    @Autowired
    private BookDetailService bookDetailService;

    @GetMapping
    public String getBooksListPage(Model model) {
        model.addAttribute("books", bookDetailService.getBookDetails());
        return "books-list";
    }

}
