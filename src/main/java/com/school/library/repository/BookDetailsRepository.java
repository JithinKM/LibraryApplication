package com.school.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookDetailsEntity;

@Repository
public interface BookDetailsRepository extends JpaRepository<BookDetailsEntity, String> {
}
