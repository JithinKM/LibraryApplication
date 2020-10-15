package com.shs.LibraryApplication.models;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.entity.BookEntity;
import com.shs.LibraryApplication.entity.UserEntity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Book extends BookEntity implements Serializable {

    private AuthorEntity authorObj;

    private List<UserEntity> ownedUsers = new ArrayList<>();

    public AuthorEntity getAuthorObj() {
        return authorObj;
    }

    public void setAuthor(AuthorEntity author) {
        this.authorObj = author;
    }

    public List<UserEntity> getOwnedUsers() {
        return ownedUsers;
    }

    public void setOwnedUsers(List<UserEntity> ownedUsers) {
        this.ownedUsers = ownedUsers;
    }

    public Book() {

    }

    public Book(String id, String name, String author, String rack, String publication, String category,
            String language, Long purchased, int price, AuthorEntity authorObj) {

        super(id, name, author, rack, publication, category, language, purchased, price);
        this.authorObj = authorObj;
    }

    public Book(String id, String name, String author, String rack, String publication, String category,
            String language, Long purchased, int price, AuthorEntity authorObj, List<UserEntity> ownedUsers) {

        super(id, name, author, rack, publication, category, language, purchased, price);
        this.authorObj = authorObj;
        this.ownedUsers = ownedUsers;
    }
}
