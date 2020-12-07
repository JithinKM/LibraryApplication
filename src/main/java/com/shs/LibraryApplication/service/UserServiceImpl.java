package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.UserDetailsEntity;
import com.shs.LibraryApplication.enums.UserType;
import com.shs.LibraryApplication.models.User;
import com.shs.LibraryApplication.repository.UserRepository;
import com.shs.LibraryApplication.utils.CommonUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder bcryptEncoder;

    @Override
    public UserDetailsEntity findByUserDetails(final String userName) {

        return userRepository.findByUsername(userName);
    }

    @Override
    public UserDetailsEntity updateUserToken(final UserDetailsEntity user) {

        UserDetailsEntity userDetailsEntity = userRepository.findByUsername(user.getUsername());
        userDetailsEntity.setToken(user.getToken());

        return userRepository.save(userDetailsEntity);
    }

    @Override
    public User save(User user) {

        UserDetailsEntity adminUser = new UserDetailsEntity();
        adminUser.setId(CommonUtility.generateRandomStringByUUID());
        adminUser.setName(UserType.ADMIN.getType());
        adminUser.setUsername(user.getUsername());
        adminUser.setPassword(bcryptEncoder.encode(user.getPassword()));
        adminUser.setRole(UserType.ADMIN.getType());
        adminUser.setActive(Boolean.TRUE);
        UserDetailsEntity userDetailsEntity = userRepository.save(adminUser);

        return new User(userDetailsEntity.getId(), userDetailsEntity.getName(), userDetailsEntity.getUsername(), userDetailsEntity.getStandard(),
                userDetailsEntity.getPhone(), userDetailsEntity.getRole(), userDetailsEntity.getActive());
    }

}
