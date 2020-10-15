package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.models.Author;

import java.util.List;

public interface AuthorService {

    Author createAuthor(final Author request);

    List<Author> getAuthors();

    Author getAuthor(final String id);

    void deleteAuthor(final String id);

    Author updateAuthor(final Author request);
}
