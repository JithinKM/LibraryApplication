package com.school.library.service;

import java.util.List;

import com.school.library.entity.AuthorEntity;
import com.school.library.model.Author;
import org.springframework.data.domain.Page;

public interface AuthorService {

    void createAuthor(final Author author);

    Page<AuthorEntity> getAuthors(final int page, final int size);

    List<AuthorEntity> getAuthors(final String name);

    AuthorEntity getAuthor(final Long id);

    void deleteAuthor(final Long id);
}
