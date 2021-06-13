package com.school.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.library.entity.UserDetailsEntity;
import com.school.library.exception.Message;
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
	public String signup(CreateUser user, RedirectAttributes redirectAttrs) {
		UserDetailsEntity userDetailsEntity = userService.createUser(user);
		redirectAttrs.addFlashAttribute("message", 
				new Message("success","User Created", "Your User Id is <b>" + userDetailsEntity.getUser().getUsername() 
						+ "<b>. Please contact Library Admin for approving your request."));
		return "redirect:/login";
	}

}
