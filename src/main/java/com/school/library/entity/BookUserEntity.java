package com.school.library.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
	
	private Date borrowedDate;
	private Date renewalDate;
	private Date updatedDate;
	
	private boolean actionRequired = true;

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

	public Date getBorrowedDate() {
		return borrowedDate;
	}

	public void setBorrowedDate(Date borrowedDate) {
		this.borrowedDate = borrowedDate;
	}

	public Date getRenewalDate() {
		return renewalDate;
	}

	public void setRenewalDate(Date renewalDate) {
		this.renewalDate = renewalDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public boolean isActionRequired() {
		return actionRequired;
	}

	public void setActionRequired(boolean actionRequired) {
		this.actionRequired = actionRequired;
	}
	
}
