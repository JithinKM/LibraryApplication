package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.AuthorEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorRepository extends CrudRepository<AuthorEntity, String> {

}
