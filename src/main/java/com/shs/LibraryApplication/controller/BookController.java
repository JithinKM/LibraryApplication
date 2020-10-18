package com.shs.LibraryApplication.controller;

import com.shs.LibraryApplication.enums.ResponseStatus;
import com.shs.LibraryApplication.models.BaseResponse;
import com.shs.LibraryApplication.models.Book;
import com.shs.LibraryApplication.service.BookService;
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

import java.util.List;

import static com.shs.LibraryApplication.constants.LibraryConstants.BOOKS_LIST_TEMPLATE;
import static com.shs.LibraryApplication.constants.LibraryConstants.BOOK_LIST_URL;

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
