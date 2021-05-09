package com.school.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.UserDetailsEntity;

@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetailsEntity, Long> {

}
