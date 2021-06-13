package com.school.library.controller;

import org.apache.commons.lang3.StringUtils;
import com.school.library.entity.UserDetailsEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.library.config.UserPrincipal;
import com.school.library.exception.Message;
import com.school.library.model.CreateUser;
import com.school.library.model.User;
import com.school.library.repository.UserRepository;
import com.school.library.service.UserService;

@Controller
public class UserController {
	
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Autowired
	UserRepository userRepository;

    @Autowired
    UserService userService;

    @GetMapping("/user")
    public String getUsersListPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
    	if (StringUtils.isNotBlank(keyword)) {
			model.addAttribute("users", userService.searchUserDetails(keyword));
			model.addAttribute("keyword", keyword);
			return "users-list";
		}
    	
    	model.addAttribute("users", userService.getAllNonAdminUsers());
        return "users-list";
    }

    @GetMapping("/user/profile")
    public String getUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, Model model) {
    	model.addAttribute("user", new User(userService.findByUsername(userPrincipal.getUsername())));
    	model.addAttribute("currentBooks", userService.getCurrentOwnedBooks(userPrincipal.getUsername()));
    	model.addAttribute("bookHistory", userService.getBookHistory(userPrincipal.getUsername()));
    	return "profile";
    }
    
    @PostMapping("/user/profile")
    public String updateUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, CreateUser user, Model model,
    		RedirectAttributes redirectAttrs) {
    	userService.updateProfile(userPrincipal.getUsername(), user);
    	redirectAttrs.addFlashAttribute("message", new Message("success","Profile Updated", "User Profile updated successfully."));
    	return "redirect:/user/profile";
    }
    
    @GetMapping("/user/profile/avatar/{avatarId}")
    public String updateUserProfile(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable("avatarId") String avatarId,
    		Model model, RedirectAttributes redirectAttrs) {
        UserDetailsEntity userDetails = userService.updateProfileAvatar(userPrincipal.getUsername(), avatarId);
        userPrincipal.setAvatarId(userDetails.getAvatarId());
    	return "redirect:/user/profile";
    }
}
