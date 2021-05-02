package com.school.library.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "role", schema = "library")
public class RoleEntity {

	@Id
	private String role;
 
    @ManyToMany
	@JsonBackReference
	private List<UserEntity> user;
    
    public RoleEntity() {
    }

	public RoleEntity(String role) {
		this.role = role;
	}

	public List<UserEntity> getUser() {
		return user;
	}

	public void setUser(List<UserEntity> user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
    
}
