package com.school.library.service.impl;

import com.opencsv.bean.CsvBindByName;

public class LibraryCsv {

	@CsvBindByName
	private String bookId;
	
	@CsvBindByName
	private String bookName;
	
	@CsvBindByName
	private String authorName;
	
	@CsvBindByName
	private String publication;
	
	@CsvBindByName
	private String category;
	
	@CsvBindByName
	private String language;
	
	@CsvBindByName
	private String rack;
	
	@CsvBindByName
	private String date;
	
	@CsvBindByName
	private String price;
	
	public LibraryCsv() {}
	
	public LibraryCsv(String bookId, String bookName, String authorName, String publication, String category, String language,
			String rack, String date, String price) {
		this.bookId = bookId;
		this.authorName = authorName;
		this.publication = publication;
		this.category = category;
		this.language = language;
		this.rack = rack;
		this.date = date;
		this.price = price;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
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

	public String getRack() {
		return rack;
	}

	public void setRack(String rack) {
		this.rack = rack;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
