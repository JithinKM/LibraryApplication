package com.school.library.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookEntity;

public class Author extends AuthorEntity implements Serializable {

    private List<BookEntity> books = new ArrayList<>();

    public Author() {
    	super();
    }

    public List<BookEntity> getBooks() {
        return books;
    }

    public void setBooks(List<BookEntity> books) {
        this.books = books;
    }

    public Author(String id, String name, String penName, Date updatedAt) {
        super(id, name, penName, updatedAt);
    }

    public Author(String id, String name, String penName, List<BookEntity> books, Date updatedAt) {
        super(id, name, penName, updatedAt);
        this.books = books;
    }
}
