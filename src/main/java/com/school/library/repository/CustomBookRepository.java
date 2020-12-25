package com.school.library.repository;

import com.school.library.entity.BookEntity;

public interface CustomBookRepository {

    Iterable<BookEntity> findAllByName(final String name);
}
