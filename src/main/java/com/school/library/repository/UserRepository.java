package com.school.library.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.UserEntity;

@Repository
public interface UserRepository extends PagingAndSortingRepository<UserEntity, String> {

    UserEntity findByUsername(String username);
    
    UserEntity findByEmail(String email);
    
    List<UserEntity> findByRolesRoleIn(List<String> roles);

	List<UserEntity> findByStatus(String status);

	List<UserEntity> findTop10ByStatusNotOrderByUpdatedTimestampDesc(String status);

}
