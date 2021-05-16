package com.school.library.service;

import java.util.List;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;
import com.school.library.model.CreateUser;

public interface UserService {

    UserEntity findByUsername(String username);

    List<UserEntity> getAllNonAdminUsers();

    UserDetailsEntity createUser(CreateUser user);

	UserEntity updateProfile(String username, CreateUser user);

	List<BookUserEntity> getCurrentOwnedBooks(String username);

	List<BookUserEntity> getBookHistory(String username);

	BookUserEntity assignBookToUser(Long bookId, String username);
}
