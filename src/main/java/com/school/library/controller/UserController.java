package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {
	
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @GetMapping("/list")
    public String getUsersListPage(Model model) {
        return "users-list";
    }

    @GetMapping("/edit")
    public String getUsersEditPage(final ModelAndView model) {
        return "users-edit";
    }

    @PostMapping(value = "/signup")
    public String getSignupPage(final ModelAndView model) {
        return "signup";
    }

}
