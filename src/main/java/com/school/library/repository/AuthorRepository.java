package com.school.library.repository;

import com.school.library.entity.AuthorEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AuthorRepository extends PagingAndSortingRepository<AuthorEntity, Long> {

	List<AuthorEntity> findByName(String name);
}
