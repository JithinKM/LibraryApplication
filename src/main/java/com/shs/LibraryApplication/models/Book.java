package com.shs.LibraryApplication.models;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.entity.BookEntity;
import com.shs.LibraryApplication.entity.UserDetailsEntity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Book extends BookEntity implements Serializable {

    private AuthorEntity authorObj;

    private List<UserDetailsEntity> ownedUsers = new ArrayList<>();

    public AuthorEntity getAuthorObj() {
        return authorObj;
    }

    public void setAuthor(AuthorEntity author) {
        this.authorObj = author;
    }

    public List<UserDetailsEntity> getOwnedUsers() {
        return ownedUsers;
    }

    public void setOwnedUsers(List<UserDetailsEntity> ownedUsers) {
        this.ownedUsers = ownedUsers;
    }

    public Book() {

    }

    public Book(String id, String name, String author, String rack, String publication, String category,
            String language, Date purchased, BigDecimal price, boolean available, AuthorEntity authorObj,
            long updatedAt) {

        super(id, name, author, rack, publication, category, language, purchased, price, available, updatedAt);
        this.authorObj = authorObj;
    }

    public Book(String id, String name, String author, String rack, String publication, String category,
            String language, Date purchased, BigDecimal price, boolean available, AuthorEntity authorObj,
            List<UserDetailsEntity> ownedUsers, long updatedAt) {

        super(id, name, author, rack, publication, category, language, purchased, price, available, updatedAt);
        this.authorObj = authorObj;
        this.ownedUsers = ownedUsers;
    }
}
