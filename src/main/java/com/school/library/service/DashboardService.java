package com.school.library.service;

import com.school.library.entity.BookUserEntity;
import com.school.library.model.User;

import java.util.List;

public interface DashboardService {

    List<BookUserEntity> getAllActionRequiredBooks();

    List<User> getAllRegisteredUsers();

    BookUserEntity approveAssignRequest(Long bookUserId);

    BookUserEntity declineAssignRequest(Long bookUserId, String comment);

    BookUserEntity approveRenewRequest(Long bookUserId);

    BookUserEntity declineRenewRequest(Long bookUserId, String comment);

    BookUserEntity approveReturnRequest(Long bookUserId, String comment);

	BookUserEntity findBookDetails(String bookId);

	List<BookUserEntity> getBooksHistory();

	List<User> getUserHistory();

	List<BookUserEntity> getAllOverDueBooks();

}
