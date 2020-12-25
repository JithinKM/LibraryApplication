package com.school.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.models.Book;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookDetailsRepository;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDetailsRepository bookDetailsRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public void createBook(Book book) {

//        final List<String> bookIds = Arrays.asList(book
//                .getId()
//                .split(",", -1));
//
//        bookIds.forEach(id -> {
//            final BookEntity bookEntityToSave = new BookEntity(id.trim(), book.getName(), book
//                    .getAuthorObj().getId(), book.getRack(), book.getPublication(), book.getCategory(),
//                    book.getLanguage(),false, book.getPrice(), Boolean.TRUE, System.nanoTime());
//            bookRepository.save(bookEntityToSave);
//        });

    }

    @Override
    public List<BookDetailsEntity> getBooks() {
    	return bookDetailsRepository.findAll();
    }

}
