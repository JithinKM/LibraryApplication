package com.school.library.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.AuthorEntity;

@Repository
public interface AuthorRepository extends CrudRepository<AuthorEntity, String>, CustomAuthorRepository {

}
