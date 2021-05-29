package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;

public interface DashboardService {

	List<BookUserEntity> getAllActionRequiredBooks();

	List<UserEntity> getAllRegisteredUsers();

	BookUserEntity approveAssignRequest(Long bookUserId);

	BookUserEntity declineAssignRequest(Long bookUserId, String comment);

	BookUserEntity approveRenewRequest(Long bookUserId);

	BookUserEntity declineRenewRequest(Long bookUserId, String comment);

	BookUserEntity approveReturnRequest(Long bookUserId, String comment);

}
