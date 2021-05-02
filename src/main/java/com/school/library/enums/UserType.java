package com.school.library.enums;

public enum UserType {

    ADMIN("ADMIN"),
    TEACHER("TEACHER"),
    STUDENT("STUDENT");

    private String type;

    private UserType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

}
