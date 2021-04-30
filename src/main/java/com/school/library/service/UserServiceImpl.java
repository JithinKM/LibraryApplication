package com.school.library.service;

import com.school.library.entity.UserEntity;
import com.school.library.repository.UserRepository;
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
    public UserEntity findByUserDetails(final String email) {
        return userRepository.findByEmail(email);
    }

//    @Override
//    public UserEntity updateUserToken(final UserEntity user) {
//
//    	UserEntity userDetailsEntity = userRepository.findByUsername(user.getUsername());
////        userDetailsEntity.setToken(user.getToken());
//
//        return userRepository.save(userDetailsEntity);
//    }
//
//    @Override
//    public User save(User user) {
//
//    	UserEntity adminUser = new UserEntity();
//        adminUser.setId(CommonUtility.generateRandomStringByUUID());
//        adminUser.setName(UserType.ADMIN.getType());
//        adminUser.setUsername(user.getUsername());
//        adminUser.setPassword(bcryptEncoder.encode(user.getPassword()));
//        adminUser.setRole(UserType.ADMIN.getType());
//        adminUser.setActive(Boolean.TRUE);
//        UserDetailsEntity userDetailsEntity = userRepository.save(adminUser);
//
//        return new User(userDetailsEntity.getId(), userDetailsEntity.getName(), userDetailsEntity.getUsername(), userDetailsEntity.getStandard(),
//                userDetailsEntity.getPhone(), userDetailsEntity.getRole(), userDetailsEntity.getActive());
//    }

}
