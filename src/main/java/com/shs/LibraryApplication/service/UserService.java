package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.UserDetailsEntity;
import com.shs.LibraryApplication.models.User;

public interface UserService {

    UserDetailsEntity findByUserDetails(String userName);

    UserDetailsEntity updateUserToken(final UserDetailsEntity user);

    User save(User user);
}
