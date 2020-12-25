package com.school.library.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookEntity;

@Repository
public interface BookRepository extends CrudRepository<BookEntity, String> {

//    @Query("FROM BookEntity b where b.author = :author")
//    Iterable<BookEntity> findAllByAuthor(@Param("author") final String authorId);

}
