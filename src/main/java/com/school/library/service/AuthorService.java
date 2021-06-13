package com.school.library.service;

import java.util.List;

import com.school.library.entity.AuthorEntity;
import com.school.library.model.Author;

public interface AuthorService {

	List<AuthorEntity> getAllAuthors();

	List<AuthorEntity> getDefaultAuthors();

	void createAuthor(Author author);
	
	void updateAuthor(Author author);

	void deleteAuthorById(Long id);

	List<AuthorEntity> searchAuthors(String keyword);

	
	
	//need to delete below
	AuthorEntity getAuthorById(Long id);

	List<AuthorEntity> getAuthorsByName(String name);

	
}
