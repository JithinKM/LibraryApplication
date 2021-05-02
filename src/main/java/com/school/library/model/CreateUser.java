package com.school.library.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateUser {

	private String firstname;
	private String lastname;
	private String username;
	private String email;
	private String phone;
	private String type;
	private short standard;
	private char division;
	private String address;
	private String parentName;
	private String parentPhone;
	private String password;
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public short getStandard() {
		return standard;
	}
	public void setStandard(short standard) {
		this.standard = standard;
	}
	public char getDivision() {
		return division;
	}
	public void setDivision(char division) {
		this.division = division;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentPhone() {
		return parentPhone;
	}
	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
