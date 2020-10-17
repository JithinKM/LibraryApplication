package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.AuthorEntity;

public interface CustomAuthorRepository {

    Iterable<AuthorEntity> findAllByName(final String name);
}
