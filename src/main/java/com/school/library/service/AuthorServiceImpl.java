package com.school.library.service;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookEntity;
import com.school.library.models.Author;
import com.school.library.repository.AuthorRepository;
import com.school.library.repository.BookRepository;
import com.school.library.utils.CommonUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;
    
    @Override
    public List<AuthorEntity> getAuthors() {
        return authorRepository.findAll();
    }

    @Override
    public void createAuthor(final AuthorEntity authorEntity) {
        final String id = CommonUtility.generateRandomStringByUUID();
        authorRepository.save(authorEntity);
    }

    @Override
    public List<Author> getAuthors(String name) {

        List<Author> authors = new ArrayList<>();
        List<AuthorEntity> allAuthors = authorRepository.findByName(name);
        allAuthors.forEach(authorEntity -> {
            Author author = new Author(authorEntity.getId(), authorEntity.getName(), authorEntity.getPenName(),
                    authorEntity.getUpdatedAt());
            authors.add(author);
        });

        return authors;
    }

    @Override
    public Author getAuthor(final String id) {

        final Author author = new Author();
        Optional<AuthorEntity> optionalAuthorEntity = authorRepository.findById(id);

        Optional
                .ofNullable(optionalAuthorEntity)
                .ifPresent(authorEntity -> {
                    author.setId(authorEntity
                            .get()
                            .getId());
                    author.setName(authorEntity
                            .get()
                            .getName());
                    author.setPenName(authorEntity
                            .get()
                            .getPenName());
                });

        List<BookEntity> books = new ArrayList<>();
        //Iterable<BookEntity> allByAuthor = bookRepository.findAllByAuthor(author.getId());
       // allByAuthor.forEach(books::add);
        author.setBooks(books);

        return author;
    }

    @Override
    public void deleteAuthor(final String id) {
        authorRepository.deleteById(id);
    }

}
