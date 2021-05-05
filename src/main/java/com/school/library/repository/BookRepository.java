package com.school.library.repository;

import com.school.library.entity.BookEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends PagingAndSortingRepository<BookEntity, String> {

//    @Query("FROM BookEntity b where b.author = :author")
//    Iterable<BookEntity> findAllByAuthor(@Param("author") final String authorId);

}
