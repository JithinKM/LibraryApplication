package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.entity.BookEntity;
import com.shs.LibraryApplication.models.Author;
import com.shs.LibraryApplication.models.Book;
import com.shs.LibraryApplication.repository.AuthorRepository;
import com.shs.LibraryApplication.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

        bookIds.forEach(id -> {
            final BookEntity bookEntityToSave = new BookEntity(id.trim(), book.getName(), book
                    .getAuthorObj().getId(), book.getRack(), book.getPublication(), book.getCategory(),
                    book.getLanguage(), book.getPurchased(), book.getPrice(), Boolean.TRUE);
            bookRepository.save(bookEntityToSave);
        });

    }

    @Override
    public List<Book> getBooks() {

        final List<Book> books = new ArrayList<>();
        final Iterable<BookEntity> allBooks = bookRepository.findAll();
        allBooks.forEach(bookEntity -> {
            Optional<AuthorEntity> optionalAuthorEntity = authorRepository.findById(bookEntity.getAuthor());
            optionalAuthorEntity.ifPresent(authorEntity -> {
                Author author = new Author(authorEntity.getId(), authorEntity.getName(), authorEntity.getPenName());
                Book book =
                        new Book(bookEntity.getId(), bookEntity.getName(), bookEntity.getAuthor(), bookEntity.getRack(),
                                bookEntity.getPublication(), bookEntity.getCategory(), bookEntity.getLanguage(),
                                bookEntity.getPurchased(), bookEntity.getPrice(), bookEntity.isAvailable(), author);
                books.add(book);
            });
        });

        return books;
    }

}
