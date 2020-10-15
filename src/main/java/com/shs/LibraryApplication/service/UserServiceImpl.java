package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.UserEntity;
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
    public UserEntity findByUserDetails(final String userName) {

        return userRepository.findByUsername(userName);
    }

    @Override
    public UserEntity updateUserToken(final UserEntity user) {

        UserEntity userEntity = userRepository.findByUsername(user.getUsername());
        userEntity.setToken(user.getToken());

        return userRepository.save(userEntity);
    }

    @Override
    public User save(User user) {

        UserEntity adminUser = new UserEntity();
        adminUser.setId(CommonUtility.generateRandomStringByUUID());
        adminUser.setName(UserType.ADMIN.getType());
        adminUser.setUsername(user.getUsername());
        adminUser.setPassword(bcryptEncoder.encode(user.getPassword()));
        adminUser.setRole(UserType.ADMIN.getType());
        adminUser.setActive(Boolean.TRUE);
        UserEntity userEntity = userRepository.save(adminUser);

        return new User(userEntity.getId(), userEntity.getName(), userEntity.getUsername(), userEntity.getStandard(),
                userEntity.getPhone(), userEntity.getRole(), userEntity.getActive());
    }

}
