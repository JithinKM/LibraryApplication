package com.school.library.service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.school.library.entity.RoleEntity;
import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;
import com.school.library.enums.UserStatusEnum;
import com.school.library.exception.BadRequestExpection;
import com.school.library.model.CreateUser;
import com.school.library.repository.UserRepository;

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

	@Override
	public List<UserEntity> getAllNonAdminUsers() {
		return userRepository.findByRolesRoleIn(Arrays.asList("TEACHER","STUDENT"));
	}

	@Override
	public UserEntity createUser(CreateUser user) {
		//Validate user
		
		if(!Arrays.asList("STUDENT","TEACHER").contains(user.getType().trim())) {
			throw new BadRequestExpection("Role must be STUDENT/TEACHER");
		}
		
		
		String userId = user.getFirstname().trim().toLowerCase()+ user.getLastname().trim().toLowerCase();
		if("STUDENT".equalsIgnoreCase(user.getType().trim())) {
			int batch = Calendar.getInstance().get(Calendar.YEAR) + (10-user.getStandard());
			userId += "_b"+batch;
		}
		
		if(userRepository.findById(userId).isPresent()) {
			throw new BadRequestExpection("User Already Exists");
		}
		
		UserEntity userEntity = getUserEntity(user, userId);
		
		return userRepository.save(userEntity);
	}
	
	@Override
	public UserEntity updateProfile(String username, CreateUser user) {
		if(!userRepository.findById(username).isPresent()) {
			throw new BadRequestExpection("Not able to find user");
		}
		UserEntity userEntity = userRepository.findById(username).get();
		if(userEntity.getUserdetail().getStandard() > 0) {
			userEntity.getUserdetail().setStandard(user.getStandard());
			userEntity.getUserdetail().setDivision(user.getDivision());
		}
		userEntity.setEmail(user.getEmail());
		userEntity.getUserdetail().setPhone(user.getPhone());
		userEntity.getUserdetail().setParentName(user.getParentName());
		userEntity.getUserdetail().setParentPhone(user.getParentPhone());
		userEntity.getUserdetail().setAddress(user.getAddress());
		if(!StringUtils.isEmpty(user.getPassword())) {
			userEntity.setPassword(bcryptEncoder.encode(user.getPassword()));
		}
		
		return userRepository.save(userEntity);
	}

	private UserEntity getUserEntity(CreateUser user, String userId) {
		UserEntity userEntity = new UserEntity();
		
		userEntity.setUsername(userId);
		userEntity.setEmail(user.getEmail());
		userEntity.setPassword(bcryptEncoder.encode(user.getPassword()));
		HashSet<RoleEntity> roles = new HashSet<>();
		roles.add(new RoleEntity(user.getType()));
		userEntity.setRoles(roles);
		userEntity.setCreatedTimestamp(new Date());
		userEntity.setUpdatedTimestamp(new Date());
		userEntity.setStatus(UserStatusEnum.PENDING.getStatus());
		
		UserDetailsEntity userDetailsEntity = new UserDetailsEntity();
		userDetailsEntity.setAddress(Objects.toString(user.getAddress(), ""));
		userDetailsEntity.setDivision(user.getDivision());
		userDetailsEntity.setFirstname(Objects.toString(user.getFirstname(), ""));
		userDetailsEntity.setLastname(Objects.toString(user.getLastname(), ""));
		userDetailsEntity.setParentName(Objects.toString(user.getParentName(), ""));
		userDetailsEntity.setParentPhone(Objects.toString(user.getParentPhone(), ""));
		userDetailsEntity.setPhone(Objects.toString(user.getPhone(), ""));
		userDetailsEntity.setStandard(user.getStandard());
		
		userEntity.setUserdetail(userDetailsEntity);
		
		return userEntity;
	}

    

    
    
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
