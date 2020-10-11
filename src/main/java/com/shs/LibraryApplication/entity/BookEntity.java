package com.shs.LibraryApplication.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "book", schema = "library")
public class BookEntity {

    @Id
    private String id;

    @Column
    private String name;

    @Column
    private String rack;

    @Column
    private String publication;

    @Column
    private String category;

    @Column
    private String language;

    @Column
    private Long purchased;

    @Column
    private int price;

    @ManyToOne(targetEntity = AuthorEntity.class)
    private AuthorEntity author;

    @ManyToMany(targetEntity = UserEntity.class)
    private List<UserEntity> ownedUsers = new ArrayList<>();

}
