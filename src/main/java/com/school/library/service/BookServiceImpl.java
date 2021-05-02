package com.school.library.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.management.RuntimeErrorException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.model.Book;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookDetailsRepository;
import com.school.library.repository.BookRepository;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BookDetailsRepository bookDetailsRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public void createBook(Book book) {
    	if(StringUtils.isBlank(book.getId())) {
    		throw new RuntimeErrorException(null, "Book id can't be empty");
    	}
    	
		BookDetailsEntity bookDetailsEntity = new BookDetailsEntity(book.getBookDetails(), new AuthorEntity(book.getBookDetails().getAuthor()));
		
		BookEntity bookEntity = new BookEntity(book.getId(), book.getContributedBy(), book.getPrice(), book.getRack(),
				book.getStatus(), book.getPurchasedDate(), book.getCreatedTimestamp(), new Date(), bookDetailsEntity);
        bookRepository.save(bookEntity);
    }
    
    @Override
    public void createBook(BookEntity book) {
        bookRepository.save(book);
    }

    @Override
	public void createBooks(Book book) {
		String bookIds = book.getBookIds();

		AuthorEntity authorEntity = new AuthorEntity(book.getBookDetails().getAuthor());
		BookDetailsEntity bookDetailsEntity = new BookDetailsEntity(book.getBookDetails(), authorEntity);
		BookDetailsEntity savedBookDetails = bookDetailsRepository.save(bookDetailsEntity);

		List<BookEntity> bookEntities = StringUtils.isNotEmpty(bookIds)
				? Arrays.stream(bookIds.split(",")).distinct()
						.map(id -> new BookEntity(id, book.getContributedBy(), book.getPrice(), book.getRack(),
								"AVAILABLE", book.getPurchasedDate(), new Date(), new Date(), savedBookDetails))
						.collect(Collectors.toList())
				: new ArrayList<>();
		bookRepository.saveAll(bookEntities);
	}

    @Override
    public List<BookDetailsEntity> getBooks() {
    	return bookDetailsRepository.findAll();
    }

    @Override
    public void deleteBook(String id) {
    	//get book check if it is associated with any user then dont delete
        bookRepository.deleteById(id);
    }

}
