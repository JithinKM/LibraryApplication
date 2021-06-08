package com.school.library.repository;

import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookDetailsEntity;

@Repository
public interface BookDetailsRepository extends PagingAndSortingRepository<BookDetailsEntity, Long>,
QuerydslPredicateExecutor<BookDetailsEntity>{
}
