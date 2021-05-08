package com.school.library.service;

import java.util.List;

import com.school.library.entity.UserEntity;
import com.school.library.model.CreateUser;

public interface UserService {

    UserEntity findByUserDetails(String userName);

    List<UserEntity> getAllNonAdminUsers();

    UserEntity createUser(CreateUser user);

	UserEntity updateProfile(String username, CreateUser user);
}
