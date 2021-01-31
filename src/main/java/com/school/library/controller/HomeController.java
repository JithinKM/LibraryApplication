package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    public static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    
    @GetMapping("/")
    public String homeDashboard() {
        return "home";
    }
    
    @GetMapping("/admin")
    public String adminDashboard() {
        return "admin-dashboard";
    }
    
    @GetMapping(value = "/signup")
    public String getSignupPage(final ModelAndView model) {
        return "signup";
    }
}
