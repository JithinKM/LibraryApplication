package com.shs.LibraryApplication.models;

import com.shs.LibraryApplication.entity.BookEntity;
import com.shs.LibraryApplication.entity.UserEntity;

import java.io.Serializable;
import java.util.List;

public class User extends UserEntity implements Serializable {

    private List<BookEntity> books;

    public List<BookEntity> getBooks() {
        return books;
    }

    public void setBooks(List<BookEntity> books) {
        this.books = books;
    }

    public User() {

    }

    public User(String id, String name, String username, String standard, String phone, String role, Boolean active) {

        super(id, name, username, standard, phone, role, active);
    }

    public User(String id, String name, String username, String standard, String phone, String role,
            String password, Boolean active, String token, long updatedAt) {

        super(id, name, username, standard, phone, role, password, active, token, updatedAt);
    }

}
