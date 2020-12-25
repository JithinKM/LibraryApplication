package com.school.library.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "book", schema = "library")
public class BookEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;
	private String contibutedBy;
	private BigDecimal price;
	private String rack;
	private String staus;
	private Date createdTimestamp;
	private Date updatedTimestamp;

	@ManyToOne
	private UserEntity user;

	@ManyToOne
	private BookDetailsEntity bookDetails;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContibutedBy() {
		return contibutedBy;
	}

	public void setContibutedBy(String contibutedBy) {
		this.contibutedBy = contibutedBy;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getRack() {
		return rack;
	}

	public void setRack(String rack) {
		this.rack = rack;
	}

	public String getStaus() {
		return staus;
	}

	public void setStaus(String staus) {
		this.staus = staus;
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

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public BookDetailsEntity getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(BookDetailsEntity bookDetails) {
		this.bookDetails = bookDetails;
	}

}
