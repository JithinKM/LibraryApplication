package com.school.library.service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookDetailsRepository;
import com.school.library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BookDetailsRepository bookDetailsRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public void createBook(BookEntity bookEntity) {
        bookRepository.save(bookEntity);
    }

    @Override
    public void createBooks(BookEntity bookEntity) {

        String bookIds = bookEntity.getBookIds();
        List<BookEntity> bookEntities = new ArrayList<>();
        if (!StringUtils.isEmpty(bookIds)) {
            Arrays
                    .stream(bookIds.split(","))
                    .distinct()
                    .forEach(id -> {
                        bookEntities.add(new BookEntity(id, bookEntity.getContributedBy(), bookEntity.getPrice(),
                                bookEntity.getRack(), bookEntity.getStatus(), bookEntity.getPurchasedDate(), new Date(),
                                new Date(), null, bookEntity.getBookDetails()));
                    });
        } else if (!StringUtils.isEmpty(bookEntity.getId())) {
            bookEntities.add(bookEntity);
        }

        bookRepository.saveAll(bookEntities);
    }

    @Override
    public List<BookDetailsEntity> getBooks() {
    	return bookDetailsRepository.findAll();
    }

    @Override
    public void deleteBook(String id) {
        bookRepository.deleteById(id);
    }

}
