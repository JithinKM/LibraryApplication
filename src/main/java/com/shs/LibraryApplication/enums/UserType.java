package com.shs.LibraryApplication.enums;

public enum UserType {

    ADMIN("ADMIN"),

    TEACHER("TEACHER"),

    STUDENT("STUDENT");

    private String type;

    UserType(final String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

}
