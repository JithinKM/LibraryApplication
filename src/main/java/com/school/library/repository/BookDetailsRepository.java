package com.school.library.repository;

import com.school.library.entity.BookDetailsEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDetailsRepository extends PagingAndSortingRepository<BookDetailsEntity, String> {
}
