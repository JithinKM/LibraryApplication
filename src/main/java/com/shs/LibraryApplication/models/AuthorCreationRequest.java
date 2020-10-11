package com.shs.LibraryApplication.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthorCreationRequest implements Serializable {

    @NotBlank
    private String name;

    @NotBlank
    private String penName;

}
