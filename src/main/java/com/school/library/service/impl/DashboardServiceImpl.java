package com.school.library.service.impl;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.school.library.entity.BookEntity;
import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;
import com.school.library.enums.BookStatusEnum;
import com.school.library.enums.BookUserStatusEnum;
import com.school.library.enums.UserStatusEnum;
import com.school.library.exception.BadRequestExpection;
import com.school.library.exception.InternalServerExpection;
import com.school.library.model.User;
import com.school.library.repository.BookRepository;
import com.school.library.repository.BookUserRepository;
import com.school.library.repository.UserRepository;
import com.school.library.service.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Value("${book.request.allowed.days}")
	private int requestDays;
	
	@Value("${book.renew.allowed.days}")
	private int renewDays;
	
	@Value("${max.allowed.book.count}")
	private int maxBooks;
	
	@Autowired
	private BookUserRepository bookUserRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BookRepository bookRepository;
	
	@Override
	public BookUserEntity assignBookToUser(String bookId, String userId) {
		
		BookEntity bookEntity = bookRepository.findById(bookId).map(x -> x)
				.orElseThrow(() -> new BadRequestExpection("No Such Book Found"));
		userRepository.findById(userId).map(x -> x)
				.orElseThrow(() -> new BadRequestExpection("No Such User Found"));
		
		//validate book is already assigned or blocked
		List<BookUserEntity> bookUserList = bookUserRepository.findByBookIdAndStatusIn(bookId, withUserReq());
		if(bookUserList.size() > 0) {
			if(bookUserList.size() == 1 && BookUserStatusEnum.REQUESTED.getStatus().equals(bookUserList.get(0).getStatus())
				&& bookUserList.get(0).getUser().getUsername().equalsIgnoreCase(userId)) {
				return approveAssignRequest(bookUserList.get(0).getId());
			} 
			System.out.println("Book is already assigned or blocked by User");
			bookUserList.forEach(x -> System.out.println(x.getId()));
			throw new InternalServerExpection("Book is already assigned or blocked by User");
		} 
		
		//user had taken max number of books?
		if(maxBooks <= bookUserRepository.findByUserUsernameAndStatusIn(userId, withUserReq()).size()) {
			System.out.println("Maximum number of books are requested/alloted");
			throw new InternalServerExpection("Maximum number of books are requested/alloted");
		}
		
		Date date = Date.from(LocalDate.now().plusDays(requestDays).atStartOfDay(ZoneId.systemDefault()).toInstant());
		BookUserEntity bookUserEntity = new BookUserEntity().requestBook(bookId, userId).assignBook(date) ;
		bookUserEntity = bookUserRepository.save(bookUserEntity);
		
		bookEntity.setStatus(BookStatusEnum.NOTAVAILABLE.getStatus());
		bookEntity.setUpdatedTimestamp(new Date());
		bookRepository.save(bookEntity);
		return bookUserEntity;
	}

	@Override
	public List<BookUserEntity> getAllActionRequiredBooks() {
		return bookUserRepository.findByActionRequiredTrue();
	}
	
	@Override
	public List<BookUserEntity> getBooksHistory() {
		return bookUserRepository.findTop10ByActionRequiredFalseOrderByUpdatedDateDesc();
	}

	@Override
	public List<BookUserEntity> getAllOverDueBooks() {
		return bookUserRepository.findByStatusInAndDueDateLessThan(withUser(), new Date())
				.stream().sorted((a, b)-> Double.compare(b.getOverDueDays(), a.getOverDueDays())).collect(Collectors.toList());
	}

	@Override
	public List<User> getNewRegisteredUsers() {
		return userRepository.findByStatus(UserStatusEnum.PENDING.getStatus())
				.stream().map(User::new)
				.collect(Collectors.toList());
	}
	
	@Override
	public List<String> getAllRegisteredUserNames() {
		return userRepository.findByStatus(UserStatusEnum.ACTIVE.getStatus())
				.stream().map(UserEntity::getUsername).collect(Collectors.toList());	
	}
	
	@Override
	public List<User> getUserHistory() {
		return userRepository.findTop10ByStatusNotOrderByUpdatedTimestampDesc(UserStatusEnum.PENDING.getStatus())
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
		bookUserEntity = bookUserRepository.save(bookUserEntity);
		
		BookEntity bookEntity = bookUserEntity.getBook();
		bookEntity.setStatus(BookStatusEnum.AVAILABLE.getStatus());
		bookEntity.setUpdatedTimestamp(new Date());
		bookRepository.save(bookEntity);
		
		return bookUserEntity;
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
		bookUserEntity = bookUserRepository.save(bookUserEntity);
		
		BookEntity bookEntity = bookUserEntity.getBook();
		bookEntity.setStatus(BookStatusEnum.AVAILABLE.getStatus());
		bookEntity.setUpdatedTimestamp(new Date());
		bookRepository.save(bookEntity);
		
		return bookUserEntity;
	}
	
	@Override
	public BookUserEntity findBookDetails(String bookId) {
		List<BookUserEntity> bookUserList = bookUserRepository.findByBookIdAndStatusIn(bookId, withUser());
		if(bookUserList.size() == 0) {
			return null;
		} else if(bookUserList.size() > 1) {
			bookUserList.forEach(x -> System.out.println(x.getStatus()));
			System.out.println("You are in trouble..........");
			throw new InternalServerExpection("Internal Server Exception");
		}
		return bookUserList.get(0);
	}
	
	@Override
	public List<BookUserEntity> findAllBookDetails(String searchBookId) {
		return bookUserRepository.findByBookIdOrderByUpdatedDateDesc(searchBookId);
	}
	
	@Override
	public List<BookUserEntity> findAllUserDetails(String searchUserId) {
		return bookUserRepository.findByUserUsernameOrderByUpdatedDateDesc(searchUserId);
	}
	
	private Optional<BookUserEntity> validateBookRequest(Long bookUserId) {
		Optional<BookUserEntity> bookUser = bookUserRepository.findById(bookUserId);
		if(!bookUser.isPresent()) {
			throw new BadRequestExpection("No such book request found");
		}
		return bookUser;
	}
	
	private List<String> withUser() {
		return Arrays.asList(BookUserStatusEnum.ALLOTED.getStatus(),
				BookUserStatusEnum.RENEWREQUESTED.getStatus(),BookUserStatusEnum.RENEWDECLINED.getStatus());
	}
	
	private List<String> withUserReq() {
		return Arrays.asList(BookUserStatusEnum.ALLOTED.getStatus(), BookUserStatusEnum.REQUESTED.getStatus(),
				BookUserStatusEnum.RENEWREQUESTED.getStatus(),BookUserStatusEnum.RENEWDECLINED.getStatus());
	}

}
