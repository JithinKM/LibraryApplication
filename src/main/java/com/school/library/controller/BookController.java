package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.school.library.enums.ResponseStatus;
import com.school.library.models.BaseResponse;
import com.school.library.models.Book;
import com.school.library.service.BookService;

import static com.school.library.constants.LibraryConstants.BOOKS_LIST_TEMPLATE;
import static com.school.library.constants.LibraryConstants.BOOK_LIST_URL;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    public static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public ModelAndView getBooksListPage(final ModelAndView model) {

        final List<Book> books = bookService.getBooks();
        model.addObject("books", books);
        model.setViewName(BOOKS_LIST_TEMPLATE);
        return model;
    }

    @PostMapping("/add")
    public ResponseEntity<BaseResponse> createAuthor(@RequestBody final Book request) {

        try {
            bookService.createBook(request);
        } catch (Exception exception) {
            return ResponseEntity.ok(new BaseResponse(ResponseStatus.ERROR, "", exception.getMessage()));
        }
        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", BOOK_LIST_URL));
    }

    @PostMapping("/edit")
    public ResponseEntity<BaseResponse> editBook(@RequestBody final Book request) {

        try {
            bookService.createBook(request);
        } catch (Exception exception) {
            return ResponseEntity.ok(new BaseResponse(ResponseStatus.ERROR, "", exception.getMessage()));
        }

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", BOOK_LIST_URL));
    }

}
