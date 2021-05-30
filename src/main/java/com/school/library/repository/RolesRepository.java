package com.school.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.library.entity.RoleEntity;

@Repository
public interface RolesRepository extends JpaRepository<RoleEntity, String> {
}
