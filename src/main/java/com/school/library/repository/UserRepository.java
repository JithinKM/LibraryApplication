package com.school.library.repository;

import com.school.library.entity.UserEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends PagingAndSortingRepository<UserEntity, String> {

    UserEntity findByUsername(String username);
    
    UserEntity findByEmail(String email);
    
    List<UserEntity> findByRolesRoleIn(List<String> roles);

	List<UserEntity> findByStatus(String status);

}
