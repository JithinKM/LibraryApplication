package com.school.library.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "book", schema = "library")
public class BookEntity {

	@Id
	private String id;

	@Transient
	private String bookIds;
	private String contributedBy;
	private BigDecimal price;
	private String rack;
	private String status;
	private Date purchasedDate;
	private Date createdTimestamp;
	private Date updatedTimestamp;

	@ManyToMany
	@JsonBackReference
	private List<UserEntity> users;

	@ManyToOne
	@JsonManagedReference
	private BookDetailsEntity bookDetails;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContributedBy() {
		return contributedBy;
	}

	public void setContributedBy(String contributedBy) {
		this.contributedBy = contributedBy;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public List<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserEntity> users) {
		this.users = users;
	}

	public BookDetailsEntity getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(BookDetailsEntity bookDetails) {
		this.bookDetails = bookDetails;
	}

	public Date getPurchasedDate() {
		return purchasedDate;
	}

	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}

	public String getBookIds() {
		return bookIds;
	}

	public void setBookIds(String bookIds) {
		this.bookIds = bookIds;
	}

	public BookEntity(String id, String contributedBy, BigDecimal price, String rack, String status,
			Date purchasedDate,
			Date createdTimestamp, Date updatedTimestamp, List<UserEntity> users, BookDetailsEntity bookDetails) {
		this.id = id;
		this.contributedBy = contributedBy;
		this.price = price;
		this.rack = rack;
		this.status = status;
		this.purchasedDate = purchasedDate;
		this.createdTimestamp = createdTimestamp;
		this.updatedTimestamp = updatedTimestamp;
		this.users = users;
		this.bookDetails = bookDetails;
	}
}
