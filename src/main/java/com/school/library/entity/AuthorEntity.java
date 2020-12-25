package com.school.library.entity;

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
	private String id;
	private String name;
	private String penName;
	private long updatedAt;

	@OneToMany(mappedBy = "author")
	private List<BookDetailsEntity> bookDetailsList;

	public AuthorEntity() {
	}
			
	public AuthorEntity(String id2, String name2, String penName2, long nanoTime) {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public long getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(long updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<BookDetailsEntity> getBookDetailsList() {
		return bookDetailsList;
	}

	public void setBookDetailsList(List<BookDetailsEntity> bookDetailsList) {
		this.bookDetailsList = bookDetailsList;
	}

}
