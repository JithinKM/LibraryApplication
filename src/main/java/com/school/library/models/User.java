package com.school.library.models;

import java.io.Serializable;
import java.util.List;

import com.school.library.entity.BookEntity;
import com.school.library.entity.UserDetailsEntity;

public class User extends UserDetailsEntity implements Serializable {

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

      //  super(id, name, username, standard, phone, role, active);
    }

    public User(String id, String name, String username, String standard, String phone, String role,
            String password, Boolean active, String token, long updatedAt) {

       // super(id, name, username, standard, phone, role, password, active, token, updatedAt);
    }

}
