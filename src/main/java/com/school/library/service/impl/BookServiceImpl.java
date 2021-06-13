package com.school.library.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.management.RuntimeErrorException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Predicate;
import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.entity.QBookDetailsEntity;
import com.school.library.model.Book;
import com.school.library.repository.BookDetailsRepository;
import com.school.library.repository.BookRepository;
import com.school.library.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Value("${book.visible.count}")
	private int visbleCount;
	
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BookDetailsRepository bookDetailsRepository;

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
    public List<BookDetailsEntity> getDefaultBooks(String visibleOrder) {
    	Stream<BookDetailsEntity> books = Stream.of();
    	switch (visibleOrder) {
		case "RANDOM":
			books = bookDetailsRepository.findBookDetails().stream().filter(x -> x.getCount() > 0);
			break;
		case "LATEST":
			books = bookDetailsRepository.findAllByOrderByCreatedTimestampDesc().stream();
			break;
		default:
			books = bookDetailsRepository.findBookDetails().stream().filter(x -> x.getCount() > 0);
			break;
		}
        return books.limit(visbleCount).collect(Collectors.toList());
    }

    @Override
    public void deleteBook(String id) {
    	//get book check if it is associated with any user then dont delete
        bookRepository.deleteById(id);
    }

	@Override
	public List<BookDetailsEntity> getAllBooks() {
		return bookDetailsRepository.findAll();
	}
	
	//Book Details Search ----------------------------------------------------------------
	@Override
	public List<BookDetailsEntity> searchBookDetails(String keyword) {
		OrderSpecifier<String> sortByName = QBookDetailsEntity.bookDetailsEntity.name.asc();
		return (List<BookDetailsEntity>) bookDetailsRepository.findAll(predicateBookDetails(keyword), sortByName);
	}

	private Predicate predicateBookDetails(String keyword) {
		QBookDetailsEntity qBookDetailsEntity = QBookDetailsEntity.bookDetailsEntity;
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		if(StringUtils.isNotBlank(keyword)) {
			booleanBuilder.or(qBookDetailsEntity.name.likeIgnoreCase("%" + keyword + "%"));
			booleanBuilder.or(qBookDetailsEntity.author.name.likeIgnoreCase("%" + keyword + "%"));
		}
		return booleanBuilder.getValue();
	}
}
