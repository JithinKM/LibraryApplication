package com.school.library.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "author", schema = "library")
public class AuthorEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String penName;
	private Date updatedAt;

	@OneToMany(mappedBy = "author")
	@JsonBackReference
	private List<BookDetailsEntity> bookDetailsList;

	public AuthorEntity() {
	}
			
	public AuthorEntity(String id2, String name2, String penName2, Date nanoTime) {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPenName() {
		return penName;
	}

	public void setPenName(String penName) {
		this.penName = penName;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<BookDetailsEntity> getBookDetailsList() {
		return bookDetailsList;
	}

	public void setBookDetailsList(List<BookDetailsEntity> bookDetailsList) {
		this.bookDetailsList = bookDetailsList;
	}

}
