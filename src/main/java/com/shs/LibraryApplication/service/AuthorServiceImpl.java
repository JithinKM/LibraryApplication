package com.shs.LibraryApplication.service;

import com.shs.LibraryApplication.entity.AuthorEntity;
import com.shs.LibraryApplication.models.Author;
import com.shs.LibraryApplication.repository.AuthorRepository;
import com.shs.LibraryApplication.utils.CommonUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public Author createAuthor(final Author request) {

        final String id = CommonUtility.generateRandomStringByUUID();
        final AuthorEntity authorEntityToSave = new AuthorEntity(id, request.getName(), request.getPenName());
        final AuthorEntity savedAuthorEntity = authorRepository.save(authorEntityToSave);

        return new Author(savedAuthorEntity.getId(), savedAuthorEntity.getName(), savedAuthorEntity.getPenName());
    }

}
