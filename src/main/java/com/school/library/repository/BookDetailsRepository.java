package com.school.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookDetailsEntity;

import java.util.List;

@Repository
public interface BookDetailsRepository extends JpaRepository<BookDetailsEntity, Long>,
QuerydslPredicateExecutor<BookDetailsEntity>{

    @Query("SELECT c FROM BookDetailsEntity c ORDER BY random()")
    List<BookDetailsEntity> findBookDetails();

}
