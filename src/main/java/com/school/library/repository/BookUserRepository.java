package com.school.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookUserEntity;
import com.school.library.enums.BookUserStatusEnum;

@Repository
public interface BookUserRepository extends JpaRepository<BookUserEntity, Long> {

	List<BookUserEntity> findByActionRequiredTrue();

	List<BookUserEntity> findByUserUsernameAndStatusIn(String username, List<String> statusList);
}
