package com.school.library.service;

import com.school.library.entity.AuthorEntity;

import java.util.List;

public interface AuthorService {

    void createAuthor(final AuthorEntity authorEntity);

    List<AuthorEntity> getAuthors();

    List<AuthorEntity> getAuthors(final String name);

    AuthorEntity getAuthor(final String id);

    void deleteAuthor(final String id);
}
