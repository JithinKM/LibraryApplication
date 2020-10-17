package com.shs.LibraryApplication.controller;

import com.shs.LibraryApplication.enums.ResponseStatus;
import com.shs.LibraryApplication.models.Author;
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
        model.setViewName("books-list");
        return model;
    }

    @PostMapping("/add")
    public ResponseEntity<BaseResponse> createAuthor(@RequestBody final Book request) {

        bookService.createBook(request);
        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", BOOK_LIST_URL));
    }

    @GetMapping("/edit")
    public ModelAndView getBooksEditPage(final ModelAndView model) {
        model.setViewName("books-edit");
        return model;
    }

}
