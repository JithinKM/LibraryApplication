package com.school.library.controller;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.school.library.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {
	
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Autowired
	UserRepository userRepository; 

    @GetMapping
    public String getUsersListPage(Model model) {
    	userRepository.findByRolesRoleIn(Arrays.asList("TEACHER","STUDENT")).stream().forEach(x->{
    		System.out.println(x.getRoles().toString());
    	});
    	model.addAttribute("users", userRepository.findByRolesRoleIn(Arrays.asList("TEACHER","STUDENT")));
        return "users-list";
    }

    @GetMapping("/edit")
    public String getUsersEditPage(final ModelAndView model) {
        return "users-edit";
    }

}
