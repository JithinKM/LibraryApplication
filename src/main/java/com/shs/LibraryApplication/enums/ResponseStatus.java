package com.shs.LibraryApplication.enums;

public enum ResponseStatus {

    SUCCESS("success"),

    ERROR("error");

    private String status;

    ResponseStatus(final String status) {
        this.status = status;
    }

    public String getStatus() {
        return this.status;
    }

}
