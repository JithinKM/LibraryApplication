package com.shs.LibraryApplication.repository;

import com.shs.LibraryApplication.entity.UserEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, String> {

    UserEntity findByUsername(String username);

}
