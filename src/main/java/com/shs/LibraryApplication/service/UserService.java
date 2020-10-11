package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.UserEntity;
import com.shs.LibraryApplication.models.UserRequest;
import com.shs.LibraryApplication.models.UserResponse;

public interface UserService {

    UserEntity findByUserDetails(String userName);

    UserEntity updateUserToken(final UserEntity user);

    UserResponse save(UserRequest user);
}
