package com.school.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.school.library.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>, QuerydslPredicateExecutor<UserEntity> {

    UserEntity findByUsername(String username);
    
    UserEntity findByEmail(String email);
    
    List<UserEntity> findByRolesRoleIn(List<String> roles);

	List<UserEntity> findByStatus(String status);

	List<UserEntity> findTop10ByStatusNotOrderByUpdatedTimestampDesc(String status);

}
