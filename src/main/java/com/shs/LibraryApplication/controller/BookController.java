package com.shs.LibraryApplication.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/book")
public class BookController {
    public static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @GetMapping("/list")
    public ModelAndView getBooksListPage(final ModelAndView model) {
        model.setViewName("books-list");
        return model;
    }

    @GetMapping("/edit")
    public ModelAndView getBooksEditPage(final ModelAndView model) {
        model.setViewName("books-edit");
        return model;
    }

}
