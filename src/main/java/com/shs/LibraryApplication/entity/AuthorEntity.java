package com.shs.LibraryApplication.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "author", schema = "library")
public class AuthorEntity {

    @Id
    private String id;

    @Column
    private String name;

    @Column
    private String penName;

    @OneToMany(targetEntity = BookEntity.class)
    private List<BookEntity> books = new ArrayList<>();

}
