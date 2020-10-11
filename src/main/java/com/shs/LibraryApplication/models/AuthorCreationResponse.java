package com.shs.LibraryApplication.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthorCreationResponse {

    private String id;

    private String name;

    private String penName;

}
