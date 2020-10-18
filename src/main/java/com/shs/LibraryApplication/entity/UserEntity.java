package com.shs.LibraryApplication.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public long getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public UserEntity() {

    }

    public UserEntity(String id, String name, String username, String standard, String phone, String role,
            Boolean active) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.standard = standard;
        this.phone = phone;
        this.role = role;
        this.active = active;
    }

    public UserEntity(String id, String name, String username, String standard, String phone, String role,
            String password, Boolean active, String token, long updatedAt) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.standard = standard;
        this.phone = phone;
        this.role = role;
        this.password = password;
        this.active = active;
        this.token = token;
        this.updatedAt = updatedAt;
    }
}
