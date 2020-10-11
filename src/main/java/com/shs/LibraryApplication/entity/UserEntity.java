package com.shs.LibraryApplication.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Data
@Table(name = "user", schema = "library")
public class UserEntity {

    @Column
    private String id;

    @Column
    private String name;

    @Id
    private String username;

    @Column
    private String standard;

    @Column
    private String phone;

    @Column
    private String role;

    @Column
    @JsonIgnore
    private String password;

    @Column
    private Boolean active;

    @Column
    private String token;

    @ManyToMany(targetEntity = BookEntity.class)
    private List<BookEntity> books;

}
