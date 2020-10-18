package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.BookEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends CrudRepository<BookEntity, String> {

    @Query("FROM BookEntity b where b.author = :author")
    Iterable<BookEntity> findAllByAuthor(@Param("author") final String authorId);

}
