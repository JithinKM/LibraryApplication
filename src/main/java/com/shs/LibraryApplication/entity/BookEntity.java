package com.shs.LibraryApplication.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "book", schema = "library")
public class BookEntity {

    @Id
    private String id;

    @Column
    private String name;

    @Column
    private String author;

    @Column
    private String rack;

    @Column
    private String publication;

    @Column
    private String category;

    @Column
    private String language;

    @Column
    private Date purchased;

    @Column
    private BigDecimal price;

    @Column
    private boolean available;

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getRack() {
        return rack;
    }

    public void setRack(String rack) {
        this.rack = rack;
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

    public Date getPurchased() {
        return purchased;
    }

    public void setPurchased(Date purchased) {
        this.purchased = purchased;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public BookEntity() {

    }

    public BookEntity(String id, String name, String author, String rack, String publication, String category,
            String language, Date purchased, BigDecimal price, boolean available) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.rack = rack;
        this.publication = publication;
        this.category = category;
        this.language = language;
        this.purchased = purchased;
        this.price = price;
        this.available = available;
    }
}
