package com.school.library.service;

import com.school.library.entity.UserDetailsEntity;
import com.school.library.models.User;

public interface UserService {

    UserDetailsEntity findByUserDetails(String userName);

    UserDetailsEntity updateUserToken(final UserDetailsEntity user);

    User save(User user);
}
