package com.school.library.models;

import java.io.Serializable;

import com.school.library.enums.ResponseStatus;

public class BaseResponse implements Serializable {

    private ResponseStatus status;

    private String jwttoken;

    private String message = "";

    public ResponseStatus getStatus() {
        return status;
    }

    public void setStatus(ResponseStatus status) {
        this.status = status;
    }

    public String getJwttoken() {
        return jwttoken;
    }

    public void setJwttoken(String jwttoken) {
        this.jwttoken = jwttoken;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public BaseResponse(ResponseStatus status, String jwttoken, String message) {
        this.status = status;
        this.jwttoken = jwttoken;
        this.message = message;
    }

}
