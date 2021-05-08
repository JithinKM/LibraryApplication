package com.school.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;
import com.school.library.enums.UserStatusEnum;
import com.school.library.repository.BookUserRepository;
import com.school.library.repository.UserRepository;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	private BookUserRepository bookUserRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<BookUserEntity> getAllActionRequiredBooks() {
		return bookUserRepository.findByActionRequiredTrue();
	}

	@Override
	public List<UserEntity> getAllRegisteredUsers() {
		return userRepository.findByStatus(UserStatusEnum.PENDING.getStatus());
	}

	
}
