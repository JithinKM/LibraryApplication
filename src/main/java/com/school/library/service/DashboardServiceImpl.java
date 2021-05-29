package com.school.library.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.school.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;
import com.school.library.enums.UserStatusEnum;
import com.school.library.exception.BadRequestExpection;
import com.school.library.repository.BookUserRepository;
import com.school.library.repository.UserRepository;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Value("${book.request.allowed.days}")
	private int requestDays;
	
	@Value("${book.renew.allowed.days}")
	private int renewDays;
	
	@Autowired
	private BookUserRepository bookUserRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<BookUserEntity> getAllActionRequiredBooks() {
		return bookUserRepository.findByActionRequiredTrue();
	}

	@Override
	public List<User> getAllRegisteredUsers() {

		return userRepository.findByStatus(UserStatusEnum.PENDING.getStatus())
				.stream().map(User::new)
				.collect(Collectors.toList());
	}

	@Override
	public BookUserEntity approveAssignRequest(Long bookUserId) {
		Optional<BookUserEntity> bookUser = validateBookRequest(bookUserId);
		Date date = Date.from(LocalDate.now().plusDays(requestDays).atStartOfDay(ZoneId.systemDefault()).toInstant());
		BookUserEntity bookUserEntity = bookUser.get().assignBook(date);
		return bookUserRepository.save(bookUserEntity);
	}

	@Override
	public BookUserEntity declineAssignRequest(Long bookUserId, String comment) {
		Optional<BookUserEntity> bookUser = validateBookRequest(bookUserId);
		BookUserEntity bookUserEntity = bookUser.get().declineBook(comment);
		return bookUserRepository.save(bookUserEntity);
	}
	
	@Override
	public BookUserEntity approveRenewRequest(Long bookUserId) {
		Optional<BookUserEntity> bookUser = validateBookRequest(bookUserId);
		Date date = Date.from(LocalDate.now().plusDays(renewDays).atStartOfDay(ZoneId.systemDefault()).toInstant());
		BookUserEntity bookUserEntity = bookUser.get().renewApproveBook(date);
		return bookUserRepository.save(bookUserEntity);
	}

	@Override
	public BookUserEntity declineRenewRequest(Long bookUserId, String comment) {
		Optional<BookUserEntity> bookUser = validateBookRequest(bookUserId);
		BookUserEntity bookUserEntity = bookUser.get().renewDeclineBook(comment);
		return bookUserRepository.save(bookUserEntity);
	}
	
	@Override
	public BookUserEntity approveReturnRequest(Long bookUserId, String comment) {
		Optional<BookUserEntity> bookUser = validateBookRequest(bookUserId);
		BookUserEntity bookUserEntity = bookUser.get().returnBook(comment);
		return bookUserRepository.save(bookUserEntity);
	}
	
	private Optional<BookUserEntity> validateBookRequest(Long bookUserId) {
		Optional<BookUserEntity> bookUser = bookUserRepository.findById(bookUserId);
		if(!bookUser.isPresent()) {
			throw new BadRequestExpection("No such book request found");
		}
		return bookUser;
	}

}
