package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.model.Book;

public interface BookService {

    void createBook(final BookEntity bookEntity);
    
    void createBook(final Book book);

    void createBooks(final Book bookEntity);

    List<BookDetailsEntity> getBooks(final int page, final int size);

    void deleteBook(String id);
}
