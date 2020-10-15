package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.UserEntity;
import com.shs.LibraryApplication.models.User;

public interface UserService {

    UserEntity findByUserDetails(String userName);

    UserEntity updateUserToken(final UserEntity user);

    User save(User user);
}
