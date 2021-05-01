package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.library.config.UserPrincipal;
import com.school.library.entity.UserEntity;
import com.school.library.model.User;
import com.school.library.repository.UserRepository;
import com.school.library.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Autowired
	UserRepository userRepository;

    @Autowired
    UserService userService;
    
    @PostMapping("/signup")
    public String signup(UserEntity user) {
    	userService.signup(user);
    	return "redirect:/login";
    }

    @GetMapping("/list")
    public String getUsersListPage(Model model) {
    	model.addAttribute("users", userService.getAllNonAdminUsers());
        return "users-list";
    }

    @GetMapping("/profile")
    public String getUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, final Model model) {
    	model.addAttribute("user", new User(userPrincipal.getUser()));
    	return "profile";
    }
    
    @PostMapping("/profile")
    public String updateUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, final Model model) {
    	//save data and then send updated profile
    	model.addAttribute("user", "");
    	return "profile";
    }
    
//  @GetMapping("/edit")
//  public String getUsersEditPage(final ModelAndView model) {
//      return "users-edit";
//  }
}
