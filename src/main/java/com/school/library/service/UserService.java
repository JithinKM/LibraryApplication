package com.school.library.service;

import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;

public interface UserService {

    UserEntity findByUserDetails(String userName);
//
//    UserEntity updateUserToken(final UserEntity user);
//
//    UserEntity save(UserEntity user);
}
