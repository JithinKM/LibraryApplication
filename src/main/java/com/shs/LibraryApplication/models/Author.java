package com.shs.LibraryApplication.models;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.entity.BookEntity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Author extends AuthorEntity implements Serializable {

    private List<BookEntity> books = new ArrayList<>();

    public Author() {

    }

    public List<BookEntity> getBooks() {
        return books;
    }

    public void setBooks(List<BookEntity> books) {
        this.books = books;
    }

    public Author(String id, String name, String penName, long updatedAt) {
        super(id, name, penName, updatedAt);
    }

    public Author(String id, String name, String penName, List<BookEntity> books, long updatedAt) {
        super(id, name, penName, updatedAt);
        this.books = books;
    }
}
