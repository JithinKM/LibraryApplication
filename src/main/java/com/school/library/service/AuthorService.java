package com.school.library.service;

import java.util.List;

import com.school.library.models.Author;

public interface AuthorService {

    Author createAuthor(final Author request);

    List<Author> getAuthors();

    List<Author> getAuthors(final String name);

    Author getAuthor(final String id);

    void deleteAuthor(final String id);

    Author updateAuthor(final Author request);
}
