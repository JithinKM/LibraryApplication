package com.school.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.school.library.model.CreateUser;
import com.school.library.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/signup")
	public String signup(CreateUser user) {
		userService.createUser(user);
		return "redirect:/login";
	}

}
