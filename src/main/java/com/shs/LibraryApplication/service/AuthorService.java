package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.models.AuthorCreationRequest;
import com.shs.LibraryApplication.models.AuthorCreationResponse;

public interface AuthorService {

    AuthorCreationResponse createAuthor(AuthorCreationRequest request);

}
