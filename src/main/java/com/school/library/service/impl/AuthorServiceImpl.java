package com.school.library.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Predicate;
import com.school.library.entity.AuthorEntity;
import com.school.library.entity.QAuthorEntity;
import com.school.library.exception.BadRequestExpection;
import com.school.library.exception.NotFoundExpection;
import com.school.library.model.Author;
import com.school.library.repository.AuthorRepository;
import com.school.library.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Value("${author.visible.count}")
	private int visbleCount;
	
    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public List<AuthorEntity> getAllAuthors() {
        return authorRepository.findAll();
    }
    
    @Override
    public List<AuthorEntity> getDefaultAuthors() {
    	return authorRepository.findAllByOrderByUpdatedAtDesc().stream().limit(visbleCount).collect(Collectors.toList());
    }
    
    @Override
    public void createAuthor(Author author) {
    	AuthorEntity authorEntity = new AuthorEntity(author);
        authorRepository.save(authorEntity);
    }
    
    @Override
	public void updateAuthor(Author author) {
    	AuthorEntity authorEntity = authorRepository.findById(author.getId()).map(x -> x).orElseThrow(() -> new NotFoundExpection("Author Not Found"));
    	authorEntity.setName(author.getName());
    	authorEntity.setPenName(author.getPenName());
    	authorEntity.setUpdatedAt(new Date());
    	authorRepository.save(authorEntity);
	}

    @Override
    public void deleteAuthorById(Long id) {
    	AuthorEntity authorEntity = authorRepository.findById(id).map(x -> x).orElseThrow(() -> new NotFoundExpection("Author Not Found"));
    	//Validate no Books are assigned currently
    	if(authorEntity.getBookDetailsList().size() > 0) {
    		throw new BadRequestExpection("Auther has BookDetails. Delte or change it before deleting author");
    	}
        authorRepository.deleteById(id);
    }

    //Author Details Search ----------------------------------------------------------------
    @Override
  	public List<AuthorEntity> searchAuthors(String keyword) {
  		OrderSpecifier<String> sortByName = QAuthorEntity.authorEntity.name.asc();
  		return (List<AuthorEntity>) authorRepository.findAll(predicateAuthors(keyword), sortByName);
  	}
  	
  	private Predicate predicateAuthors(String keyword) {
  		QAuthorEntity qAuthorEntity = QAuthorEntity.authorEntity;
  		BooleanBuilder booleanBuilder = new BooleanBuilder();
  		
  		if(StringUtils.isNotBlank(keyword)) {
  			booleanBuilder.or(qAuthorEntity.name.likeIgnoreCase("%" + keyword + "%"));
  			booleanBuilder.or(qAuthorEntity.penName.likeIgnoreCase("%" + keyword + "%"));
  		}
  		return booleanBuilder.getValue();
  	}
    
    
    
  	
  	
    
    
    
    
    @Override
    public AuthorEntity getAuthorById(Long id) {
        return authorRepository.findById(id).map(x -> x).orElseThrow(() -> new NotFoundExpection("Author Not Found"));
    }
    
    @Override
    public List<AuthorEntity> getAuthorsByName(String name) {
        return authorRepository.findByName(name);
    }
}
