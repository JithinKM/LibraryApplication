package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;

public interface DashboardService {

	List<BookUserEntity> getAllActionRequiredBooks();

	List<UserEntity> getAllRegisteredUsers();

}
