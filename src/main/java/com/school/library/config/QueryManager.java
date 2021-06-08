package com.school.library.config;


import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Predicate;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.QBookDetailsEntity;
import com.school.library.repository.BookDetailsRepository;

@Component
public class QueryManager {

	@Autowired
	private BookDetailsRepository bookDetailsRepository;

	public List<BookDetailsEntity> searchBooks(String keyword) {
		OrderSpecifier<String> sortByName = orderByBookName();
		return (List<BookDetailsEntity>) bookDetailsRepository.findAll(createPredicate(keyword), sortByName);
	}

	private Predicate createPredicate(String keyword) {
		QBookDetailsEntity qBookDetailsEntity = QBookDetailsEntity.bookDetailsEntity;
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		if(StringUtils.isNotBlank(keyword)) {
			booleanBuilder.or(qBookDetailsEntity.name.likeIgnoreCase("%" + keyword + "%"));
			booleanBuilder.or(qBookDetailsEntity.author.name.likeIgnoreCase("%" + keyword + "%"));
		}
		return booleanBuilder.getValue();
	}

	private OrderSpecifier<String> orderByBookName() {
		return QBookDetailsEntity.bookDetailsEntity.name.asc();
	}

}
