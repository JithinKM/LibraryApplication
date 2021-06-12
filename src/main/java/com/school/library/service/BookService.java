package com.school.library.service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.model.Book;

import java.util.List;

public interface BookService {

    void createBook(final BookEntity bookEntity);
    
    void createBook(final Book book);

    void createBooks(final Book bookEntity);

    List<BookDetailsEntity> getDefaultBooks(int maxVisible, String visibleOrder);

    void deleteBook(String id);

	List<BookDetailsEntity> getAllBooks();
}
