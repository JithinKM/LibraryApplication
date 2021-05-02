package com.school.library.repository;

import com.school.library.entity.AuthorEntity;

public interface CustomAuthorRepository {

    Iterable<AuthorEntity> findAllByName(final String name);
}
