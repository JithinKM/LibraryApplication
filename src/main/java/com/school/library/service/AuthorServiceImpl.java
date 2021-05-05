package com.school.library.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.school.library.entity.AuthorEntity;
import com.school.library.model.Author;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookRepository;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;

    @Override
    public Page<AuthorEntity> getAuthors(final int page, final int size) {
        return authorRepository.findAll(PageRequest.of(page, size, Sort.by("updatedAt").descending()));
    }

    @Override
    public void createAuthor(final Author author) {
    	AuthorEntity authorEntity = new AuthorEntity(author);
        authorRepository.save(authorEntity);
    }

    @Override
    public List<AuthorEntity> getAuthors(String name) {
        return authorRepository.findByName(name);
    }

    @Override
    public AuthorEntity getAuthor(final Long id) {

        final AuthorEntity author = new AuthorEntity();
        Optional<AuthorEntity> optionalAuthorEntity = authorRepository.findById(id);

//        Optional
//                .ofNullable(optionalAuthorEntity)
//                .ifPresent(authorEntity -> {
//                    author.setId(authorEntity
//                            .get()
//                            .getId());
//                    author.setName(authorEntity
//                            .get()
//                            .getName());
//                    author.setPenName(authorEntity
//                            .get()
//                            .getPenName());
//                });

      //  List<BookEntity> books = new ArrayList<>();
        //Iterable<BookEntity> allByAuthor = bookRepository.findAllByAuthor(author.getId());
       // allByAuthor.forEach(books::add);
//        author.setBooks(books);

        return optionalAuthorEntity.get();
    }

    @Override
    public void deleteAuthor(final Long id) {
        authorRepository.deleteById(id);
    }

}
