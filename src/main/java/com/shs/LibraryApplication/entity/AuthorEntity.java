package com.shs.LibraryApplication.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "author", schema = "library")
public class AuthorEntity {

    @Id
    private String id;

    @Column
    private String name;

    @Column
    private String penName;

    @Column
    private long updatedAt;

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

    public String getPenName() {
        return penName;
    }

    public void setPenName(String penName) {
        this.penName = penName;
    }

    public long getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public AuthorEntity() {

    }

    public AuthorEntity(String id, String name, String penName, long updatedAt) {
        this.id = id;
        this.name = name;
        this.penName = penName;
        this.updatedAt = updatedAt;
    }
}
