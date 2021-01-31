package com.school.library.service;

import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;

public interface UserService {

    UserDetailsEntity findByUserDetails(String userName);

    UserDetailsEntity updateUserToken(final UserDetailsEntity user);

    UserEntity save(UserEntity user);
}
