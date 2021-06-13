package com.school.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.school.library.entity.AuthorEntity;

@Repository
public interface AuthorRepository extends JpaRepository<AuthorEntity, Long>, QuerydslPredicateExecutor<AuthorEntity>  {

	List<AuthorEntity> findByName(String name);

	List<AuthorEntity> findAllByOrderByUpdatedAtDesc();
}
