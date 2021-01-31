package com.school.library.controller;

import com.school.library.entity.BookEntity;
import com.school.library.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {
    public static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

//    @GetMapping
//    public String getBooksListPage(Model model) {
//        model.addAttribute("books", bookService.getBooks());
//        return "books-list";
//    }

    @PostMapping
    public String createBooks(@RequestBody BookEntity bookEntity) {
        bookService.createBooks(bookEntity);
        return "books-list";
    }

    @DeleteMapping("/{id}")
    public String deleteBook(@PathVariable String id) {
        bookService.deleteBook(id);
        return "books-list";
    }

    @PutMapping
    public String editBook(@RequestBody BookEntity bookEntity) {
        bookService.createBook(bookEntity);
        return "books-list";
    }

}
