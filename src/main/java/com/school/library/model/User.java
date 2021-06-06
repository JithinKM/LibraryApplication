package com.school.library.model;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.school.library.entity.BookEntity;
import com.school.library.entity.UserDetailsEntity;
import com.school.library.entity.UserEntity;

public class User {

	private String username;
	private String email;
	private Date createdTimestamp;
	private Date updatedTimestamp;
	private String status;
	private List<String> roles;

	private UserDetailsEntity userdetail;
	private List<BookEntity> books;

	private String comment;

	public String getRoleValues() {
		return String.join(",", roles);
	}
	
	public boolean isActive() {
		return this.status.equalsIgnoreCase("ACTIVE");
	}
	
	public String getType() {
		if(roles.contains("ADMIN"))
			return "Admin";
		else if(roles.contains("TEACHER"))
			return "Teacher";
		return "Student";
	}
	
	public User() {
	}
	
	public User(UserEntity u) {
		this.username = u.getUsername();
		this.email = u.getEmail();
		this.createdTimestamp = u.getCreatedTimestamp();
		this.updatedTimestamp = u.getUpdatedTimestamp();
		this.status = u.getStatus();
		this.roles = u.getRoles().stream().map(x -> x.getRole()).collect(Collectors.toList());
		this.userdetail = u.getUserdetail();
		this.books = u.getBooks();
	}

	public User(String username, String email, Date createdTimestamp, Date updatedTimestamp, String status,
			List<String> roles, UserDetailsEntity userdetail, List<BookEntity> books) {
		this.username = username;
		this.email = email;
		this.createdTimestamp = createdTimestamp;
		this.updatedTimestamp = updatedTimestamp;
		this.status = status;
		this.roles = roles;
		this.userdetail = userdetail;
		this.books = books;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public Date getUpdatedTimestamp() {
		return updatedTimestamp;
	}

	public void setUpdatedTimestamp(Date updatedTimestamp) {
		this.updatedTimestamp = updatedTimestamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public UserDetailsEntity getUserdetail() {
		return userdetail;
	}

	public void setUserdetail(UserDetailsEntity userdetail) {
		this.userdetail = userdetail;
	}

	public List<BookEntity> getBooks() {
		return books;
	}

	public void setBooks(List<BookEntity> books) {
		this.books = books;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}
