package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.AuthorEntity;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;

public class CustomAuthorRepositoryImpl implements CustomAuthorRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Iterable<AuthorEntity> findAllByName(final String name) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<AuthorEntity> query = criteriaBuilder.createQuery(AuthorEntity.class);
        Root<AuthorEntity> author = query.from(AuthorEntity.class);

        Path<String> namePath = author.get("name");
        query
                .select(author)
                .where(criteriaBuilder.like(criteriaBuilder.upper(namePath), "%" + name.toUpperCase() + "%"));

        return entityManager
                .createQuery(query)
                .getResultList();
    }

}
