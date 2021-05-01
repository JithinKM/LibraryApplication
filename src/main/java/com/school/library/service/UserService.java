package com.school.library.service;

import java.util.List;

import com.school.library.entity.UserEntity;

public interface UserService {

    UserEntity findByUserDetails(String userName);

    List<UserEntity> getAllNonAdminUsers();

    void signup(UserEntity user);
}
