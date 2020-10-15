package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.models.Author;
import com.shs.LibraryApplication.repository.AuthorRepository;
import com.shs.LibraryApplication.utils.CommonUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public Author createAuthor(final Author request) {

        final String id = CommonUtility.generateRandomStringByUUID();
        final AuthorEntity authorEntityToSave = new AuthorEntity(id, request.getName(), request.getPenName());
        final AuthorEntity savedAuthorEntity = authorRepository.save(authorEntityToSave);

        return new Author(savedAuthorEntity.getId(), savedAuthorEntity.getName(), savedAuthorEntity.getPenName());
    }

    @Override
    public List<Author> getAuthors() {

        final List<Author> authors = new ArrayList<>();
        final Iterable<AuthorEntity> allAuthors = authorRepository.findAll();
        allAuthors.forEach(authorEntity -> {
            Author author = new Author(authorEntity.getId(), authorEntity.getName(), authorEntity.getPenName());
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

        // TODO: Populate books
        return author;
    }

    @Override
    public void deleteAuthor(final String id) {

        authorRepository.deleteById(id);
    }

    @Override
    public Author updateAuthor(final Author request) {
        final AuthorEntity authorEntityToSave = new AuthorEntity(request.getId(), request.getName(), request.getPenName());
        final AuthorEntity savedAuthorEntity = authorRepository.save(authorEntityToSave);

        return new Author(savedAuthorEntity.getId(), savedAuthorEntity.getName(), savedAuthorEntity.getPenName());
    }

}
