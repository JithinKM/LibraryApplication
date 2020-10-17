package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.models.Book;

import java.util.List;

public interface BookService {

    void createBook(final Book book);

    List<Book> getBooks();

}
