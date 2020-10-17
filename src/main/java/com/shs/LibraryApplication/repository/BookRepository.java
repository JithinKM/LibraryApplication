package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.BookEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends CrudRepository<BookEntity, String> {

}
