package com.school.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookEntity;
import com.school.library.models.Author;
import com.school.library.models.Book;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public void createBook(Book book) {

        final List<String> bookIds = Arrays.asList(book
                .getId()
                .split(",", -1));

//        bookIds.forEach(id -> {
//            final BookEntity bookEntityToSave = new BookEntity(id.trim(), book.getName(), book
//                    .getAuthorObj().getId(), book.getRack(), book.getPublication(), book.getCategory(),
//                    book.getLanguage(),false, book.getPrice(), Boolean.TRUE, System.nanoTime());
//            bookRepository.save(bookEntityToSave);
//        });

    }

    @Override
    public List<Book> getBooks() {

//        final List<Book> books = new ArrayList<>();
//        final Iterable<BookEntity> allBooks = bookRepository.findAll();
//        allBooks.forEach(bookEntity -> {
//            Optional<AuthorEntity> optionalAuthorEntity = authorRepository.findById(bookEntity.getAuthor());
//            optionalAuthorEntity.ifPresent(authorEntity -> {
//                Author author = new Author(authorEntity.getId(), authorEntity.getName(), authorEntity.getPenName(),
//                        authorEntity.getUpdatedAt());
//                Book book =
//                        new Book(bookEntity.getId(), bookEntity.getName(), bookEntity.getAuthor(), bookEntity.getRack(),
//                                bookEntity.getPublication(), bookEntity.getCategory(), bookEntity.getLanguage(),
//                                bookEntity.getPurchased(), bookEntity.getPrice(), bookEntity.isAvailable(), author,
//                                bookEntity.getUpdatedAt());
//                books.add(book);
//            });
//        });
//
        return null;
    }

}
