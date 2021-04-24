package com.school.library.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "user", schema = "library")
public class UserEntity {

	@Id
	private String username; //userid
	private String email;
	private String password;
	private Date createdTimestamp;
	private Date updatedTimestamp;
	private String status; //enabled/registered/active/blocked...
	
	@ManyToMany(mappedBy = "user")
	@JsonManagedReference
	private Set<RoleEntity> roles;
	
	@OneToOne(mappedBy = "user")
	@JsonManagedReference
	private UserDetailsEntity userdetail;
	
	@ManyToMany(mappedBy = "users")
	@JsonManagedReference
	@JsonBackReference
	private List<BookEntity> books;
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(Set<RoleEntity> roles) {
		this.roles = roles;
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

	public List<BookEntity> getBooks() {
		return books;
	}

	public void setBooks(List<BookEntity> books) {
		this.books = books;
	}

	public UserDetailsEntity getUserdetail() {
		return userdetail;
	}

	public void setUserdetail(UserDetailsEntity userdetail) {
		this.userdetail = userdetail;
	}
	
	public boolean isActive() {
		return this.status.equalsIgnoreCase("ACTIVE");
	}
	
}
