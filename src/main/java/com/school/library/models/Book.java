package com.school.library.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookEntity;
import com.school.library.entity.UserDetailsEntity;

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

       // super(id, name, author, rack, publication, category, language, purchased, price, available, updatedAt);
        this.authorObj = authorObj;
    }

    public Book(String id, String name, String author, String rack, String publication, String category,
            String language, Date purchased, BigDecimal price, boolean available, AuthorEntity authorObj,
            List<UserDetailsEntity> ownedUsers, long updatedAt) {

       // super(id, name, author, rack, publication, category, language, purchased, price, available, updatedAt);
        this.authorObj = authorObj;
        this.ownedUsers = ownedUsers;
    }
}
