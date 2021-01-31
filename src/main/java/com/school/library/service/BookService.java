package com.school.library.service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;

import java.util.List;

public interface BookService {

    void createBook(final BookEntity bookEntity);

    void createBooks(final BookEntity bookEntity);

    List<BookDetailsEntity> getBooks();

    void deleteBook(String id);
}
