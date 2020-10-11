package com.shs.LibraryApplication.models;

import com.shs.LibraryApplication.enums.ResponseStatus;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class BaseResponse implements Serializable {

    private ResponseStatus status;

    private final String jwttoken;

    private String message = "";

}
