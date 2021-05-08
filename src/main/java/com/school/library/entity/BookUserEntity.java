package com.school.library.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.school.library.enums.BookUserStatusEnum;

@Entity
@Table(name = "book_users", schema = "library")
public class BookUserEntity {

	@Id
	private Long id;

	@OneToOne
	@JoinColumn(name = "books_id", referencedColumnName = "id")
	private BookEntity book;

	@OneToOne
	@JoinColumn(name = "users_username", referencedColumnName = "username")
	private UserEntity user;

	private String status;
	private short renewalCount;
	private boolean actionRequired;
	private String comments;
	
	private Date requestedDate;
	private Date allotedDate;
	private Date returnedDate;
	private Date dueDate;
	private Date updatedDate;
	
	public String getStatusText() {
		return BookUserStatusEnum.valueOf(status).getStatusString();
	}
	
	public BookUserEntity requestBook() {
		renewalCount = 0;
		requestedDate = new Date();
		return getUpdatedUser(BookUserStatusEnum.REQUESTED, true);
	}
	
	public BookUserEntity declined(String comments) {
		this.comments = comments;
		return getUpdatedUser(BookUserStatusEnum.DECLINED, false);
	}

	public BookUserEntity allotBook(Date newDueDate) {
		allotedDate = new Date();
		dueDate = newDueDate;
		return getUpdatedUser(BookUserStatusEnum.ALLOTED, false);
	}
	
	public BookUserEntity renewRequest() {
		++renewalCount;
		return getUpdatedUser(BookUserStatusEnum.RENEWREQUESTED, true);
	}
	
	public BookUserEntity renewDeclined(String comments) {
		dueDate = null;
		this.comments = comments;
		return getUpdatedUser(BookUserStatusEnum.RENEWDECLINED, false);
	}
	
	public BookUserEntity renewApprove(Date newDueDate) {
		dueDate = newDueDate;
		return getUpdatedUser(BookUserStatusEnum.ALLOTED, false);
	}
	
	public BookUserEntity returnBook() {
		returnedDate = new Date();
		dueDate = null;
		return getUpdatedUser(BookUserStatusEnum.RETURNED, false);
	}
	
	private BookUserEntity getUpdatedUser(BookUserStatusEnum status, boolean actionRequired) {
		this.status = status.getStatus();
		this.actionRequired = actionRequired;
		this.updatedDate = new Date();
		return this;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BookEntity getBook() {
		return book;
	}

	public void setBook(BookEntity book) {
		this.book = book;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public short getRenewalCount() {
		return renewalCount;
	}

	public void setRenewalCount(short renewalCount) {
		this.renewalCount = renewalCount;
	}

	public boolean isActionRequired() {
		return actionRequired;
	}

	public void setActionRequired(boolean actionRequired) {
		this.actionRequired = actionRequired;
	}

	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	public Date getAllotedDate() {
		return allotedDate;
	}

	public void setAllotedDate(Date allotedDate) {
		this.allotedDate = allotedDate;
	}

	public Date getReturnedDate() {
		return returnedDate;
	}

	public void setReturnedDate(Date returnedDate) {
		this.returnedDate = returnedDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
