package com.school.library.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.library.model.BookDetails;

@Entity
@Table(name = "bookdetails", schema = "library")
@JsonIgnoreProperties(ignoreUnknown = true)
public class BookDetailsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String publication;
	private String category;
	private String language;
	private Date createdTimestamp;
	
	@Transient
	private boolean available = true;
	
	@Transient
	private int count = 1;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JsonManagedReference
	private AuthorEntity author;
	
	@OneToMany(mappedBy = "bookDetails", cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonBackReference
	private List<BookEntity> books;

	public BookDetailsEntity(BookDetails bookDetails, AuthorEntity authorEntity) {
		this.id = bookDetails.getId();
		this.name = bookDetails.getName();
		this.publication = bookDetails.getPublication();
		this.category = bookDetails.getCategory();
		this.language = bookDetails.getLanguage();
		this.createdTimestamp = new Date();
		this.author = authorEntity;
	}
	
	public BookDetailsEntity() {
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

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public AuthorEntity getAuthor() {
		return author;
	}

	public void setAuthor(AuthorEntity author) {
		this.author = author;
	}

	public List<BookEntity> getBooks() {
		return books;
	}

	public void setBooks(List<BookEntity> books) {
		this.books = books;
	}

	public boolean isAvailable() {
		return true;
	}

	public Long getCount() {
		return this.books.stream().filter(x -> x.getStatus().equalsIgnoreCase("available")).count();
	}
	
}
