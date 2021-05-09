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

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.RoleEntity;
import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;
import com.school.library.enums.BookUserStatusEnum;
import com.school.library.enums.UserStatusEnum;
import com.school.library.enums.UserType;
import com.school.library.exception.BadRequestExpection;
import com.school.library.model.CreateUser;
import com.school.library.repository.BookUserRepository;
import com.school.library.repository.UserDetailsRepository;
import com.school.library.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserDetailsRepository userDetailsRepository;
    
    @Autowired
    private BookUserRepository bookUserRepository;

    @Autowired
    private PasswordEncoder bcryptEncoder;

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

	@Override
	public List<UserEntity> getAllNonAdminUsers() {
		return userRepository.findByRolesRoleIn(Arrays.asList(UserType.TEACHER.getType(),UserType.STUDENT.getType()));
	}

	@Override
	public UserDetailsEntity createUser(CreateUser user) {
		//Validate user
		
		if(!Arrays.asList(UserType.TEACHER.getType(),UserType.STUDENT.getType()).contains(user.getType().trim().toUpperCase())) {
			throw new BadRequestExpection("Role must be STUDENT/TEACHER");
		}
		
		String userId = user.getFirstname().trim().toLowerCase() + user.getLastname().trim().toLowerCase();
		if("STUDENT".equalsIgnoreCase(user.getType().trim().toUpperCase())) {
			int batch = Calendar.getInstance().get(Calendar.YEAR) + (10-user.getStandard());
			userId += "_b"+batch;
		}
		
		if(userRepository.findById(userId).isPresent()) {
			throw new BadRequestExpection("User Already Exists");
		}
		
		UserDetailsEntity userDetailsEntity = createUserEntity(user, userId);
		return userDetailsRepository.save(userDetailsEntity);
	}
	
	@Override
	public UserEntity updateProfile(String username, CreateUser user) {
		if(!userRepository.findById(username).isPresent()) {
			System.out.println("Not able to find user");
			throw new BadRequestExpection("Not able to find user");
		}
		UserEntity userEntity = userRepository.findById(username).get();
		
		if(!StringUtils.isEmpty(user.getPassword())) {
			
			if(!bcryptEncoder.matches(user.getOldpassword(), userEntity.getPassword())) {
				System.out.println("Current password is wrong");
				throw new BadRequestExpection("Current password is wrong");
			}
			userEntity.setPassword(bcryptEncoder.encode(user.getPassword()));
		}

		if(userEntity.getUserdetail().isStudent()) {
			userEntity.getUserdetail().setStandard(user.getStandard());
			userEntity.getUserdetail().setDivision(user.getDivision());
		}
		userEntity.setEmail(user.getEmail());
		userEntity.getUserdetail().setPhone(user.getPhone());
		if(!StringUtils.isEmpty(user.getFirstname())) {
			userEntity.getUserdetail().setFirstname(user.getFirstname());
		}
		if(!StringUtils.isEmpty(user.getLastname())) {
			userEntity.getUserdetail().setLastname(user.getLastname());
		}
		userEntity.getUserdetail().setParentName(user.getParentName());
		userEntity.getUserdetail().setParentPhone(user.getParentPhone());
		userEntity.getUserdetail().setAddress(user.getAddress());
		
		return userRepository.save(userEntity);
	}

	private UserDetailsEntity createUserEntity(CreateUser user, String userId) {
		UserEntity userEntity = new UserEntity();
		
		userEntity.setUsername(userId);
		userEntity.setEmail(user.getEmail());
		userEntity.setPassword(bcryptEncoder.encode(user.getPassword()));
		HashSet<RoleEntity> roles = new HashSet<>();
		roles.add(new RoleEntity(user.getType().trim().toUpperCase()));
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
		if("STUDENT".equalsIgnoreCase(user.getType().trim().toUpperCase())) {
			userDetailsEntity.setStandard(user.getStandard());
		} else {
			userDetailsEntity.setStandard(Short.valueOf("0"));
		}
		
		
		userDetailsEntity.setUser(userEntity);
		
		return userDetailsEntity;
	}

	@Override
	public List<BookUserEntity> getCurrentOwnedBooks(String username) {
		List<String> statusList = Arrays.asList(BookUserStatusEnum.REQUESTED.getStatus(),
				BookUserStatusEnum.ALLOTED.getStatus(), BookUserStatusEnum.RENEWREQUESTED.getStatus(),
				BookUserStatusEnum.RENEWDECLINED.getStatus());
		return bookUserRepository.findByUserUsernameAndStatusIn(username, statusList);
	}

	@Override
	public List<BookUserEntity> getBookHistory(String username) {
		List<String> statusList = Arrays.asList(BookUserStatusEnum.DECLINED.getStatus(),
				BookUserStatusEnum.RETURNED.getStatus());
		return bookUserRepository.findByUserUsernameAndStatusIn(username, statusList);
	}
}
