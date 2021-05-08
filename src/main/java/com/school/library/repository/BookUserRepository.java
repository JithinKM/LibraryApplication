package com.school.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookUserEntity;

@Repository
public interface BookUserRepository extends JpaRepository<BookUserEntity, Long> {

	List<BookUserEntity> findByActionRequiredTrue();
}
