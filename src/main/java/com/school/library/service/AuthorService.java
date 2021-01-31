package com.school.library.service;

import com.school.library.entity.AuthorEntity;
import com.school.library.models.Author;

import java.util.List;

public interface AuthorService {

    void createAuthor(final AuthorEntity authorEntity);

    List<AuthorEntity> getAuthors();

    List<Author> getAuthors(final String name);

    Author getAuthor(final String id);

    void deleteAuthor(final String id);
}
