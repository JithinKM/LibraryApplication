package com.school.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.school.library.entity.UserEntity;
import com.school.library.repository.UserRepository;

@RestController
public class TestController {
	
	 @Autowired
	 private UserRepository repo;

	 @GetMapping("/testdetails")
	 public List<UserEntity> getdetails(){
		 return repo.findAll();
	 }
	
}
