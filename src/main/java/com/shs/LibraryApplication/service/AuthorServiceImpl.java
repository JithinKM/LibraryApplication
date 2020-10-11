package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.models.AuthorCreationRequest;
import com.shs.LibraryApplication.models.AuthorCreationResponse;
import com.shs.LibraryApplication.repository.AuthorRepository;
import com.shs.LibraryApplication.utils.CommonUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public AuthorCreationResponse createAuthor(final AuthorCreationRequest request) {

        // Author authorToSave = mapper.map(request, Author.class);
        final String id = CommonUtility.generateRandomStringByUUID();
        final AuthorEntity authorEntityToSave =
                new AuthorEntity(id, request.getName(), request.getPenName(), new ArrayList<>());
        final AuthorEntity savedAuthorEntity = authorRepository.save(authorEntityToSave);

        return new AuthorCreationResponse(savedAuthorEntity.getId(), savedAuthorEntity.getName(),
                savedAuthorEntity.getPenName());
    }

}
