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

    public Author(String id, String name, String penName) {
        super(id, name, penName);
    }

    public Author(String id, String name, String penName, List<BookEntity> books) {
        super(id, name, penName);
        this.books = books;
    }
}
