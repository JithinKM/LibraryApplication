package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.library.config.UserPrincipal;
import com.school.library.exception.Message;
import com.school.library.model.CreateUser;
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

    @GetMapping("/all")
    public String getUsersListPage(Model model) {
    	model.addAttribute("users", userService.getAllNonAdminUsers());
        return "users-list";
    }

    @GetMapping("/profile")
    public String getUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, Model model) {
    	model.addAttribute("user", new User(userService.findByUsername(userPrincipal.getUsername())));
    	model.addAttribute("currentBooks", userService.getCurrentOwnedBooks(userPrincipal.getUsername()));
    	model.addAttribute("bookHistory", userService.getBookHistory(userPrincipal.getUsername()));
    	return "profile";
    }
    
    @PostMapping("/profile")
    public String updateUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, CreateUser user, Model model,
    		RedirectAttributes redirectAttrs) {
    	userService.updateProfile(userPrincipal.getUsername(), user);
    	redirectAttrs.addFlashAttribute("message", new Message("success","Profile Updated", "User Profile updated successfully."));
    	return "redirect:/user/profile";
    }
    
    @PostMapping("/profile/avatar/{avatarId}")
    public String updateUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable("avatarId") String avatarId, 
    		Model model, RedirectAttributes redirectAttrs) {
    	userService.updateProfileAvatar(userPrincipal.getUsername(), avatarId);
    	return "redirect:/user/profile";
    }
}
