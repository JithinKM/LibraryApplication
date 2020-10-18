package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.BookEntity;

public interface CustomBookRepository {

    Iterable<BookEntity> findAllByName(final String name);
}
