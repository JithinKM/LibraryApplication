package com.school.library.service;

import java.util.List;

import com.school.library.entity.AuthorEntity;
import com.school.library.model.Author;

public interface AuthorService {

    void createAuthor(final Author author);

    List<AuthorEntity> getAuthors();

    List<AuthorEntity> getAuthors(final String name);

    AuthorEntity getAuthor(final Long id);

    void deleteAuthor(final Long id);
}
