package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.models.Book;

public interface BookService {

    void createBook(final Book book);

    List<BookDetailsEntity> getBooks();

}
