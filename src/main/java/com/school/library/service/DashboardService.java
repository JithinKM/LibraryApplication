package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookUserEntity;
import com.school.library.model.User;

public interface DashboardService {

    List<BookUserEntity> getAllActionRequiredBooks();

    List<User> getNewRegisteredUsers();

    BookUserEntity approveAssignRequest(Long bookUserId);

    BookUserEntity declineAssignRequest(Long bookUserId, String comment);

    BookUserEntity approveRenewRequest(Long bookUserId);

    BookUserEntity declineRenewRequest(Long bookUserId, String comment);

    BookUserEntity approveReturnRequest(Long bookUserId, String comment);

	BookUserEntity findBookDetails(String bookId);

	List<BookUserEntity> getBooksHistory();

	List<User> getUserHistory();

	List<BookUserEntity> getAllOverDueBooks();

	List<String> getAllRegisteredUserNames();

	BookUserEntity assignBookToUser(String bookId, String userId);

	List<BookUserEntity> findAllBookDetails(String searchBookId);

	List<BookUserEntity> findAllUserDetails(String trim);

}
