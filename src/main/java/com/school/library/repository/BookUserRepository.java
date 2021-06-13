package com.school.library.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.BookUserEntity;

@Repository
public interface BookUserRepository extends JpaRepository<BookUserEntity, Long> {

	List<BookUserEntity> findByActionRequiredTrue();

	List<BookUserEntity> findByUserUsernameAndStatusIn(String username, List<String> statusList);

	List<BookUserEntity> findByBookIdAndStatusIn(String bookId, List<String> statusList);

	List<BookUserEntity> findTop10ByActionRequiredFalseOrderByUpdatedDateDesc();

	List<BookUserEntity> findByStatusInAndDueDateLessThan(List<String> withUser, Date date);

	List<BookUserEntity> findByBookIdOrderByUpdatedDateDesc(String searchBookId);

	List<BookUserEntity> findByUserUsernameOrderByUpdatedDateDesc(String searchUserId);
}
