package com.shs.LibraryApplication.controller;

import com.shs.LibraryApplication.enums.ResponseStatus;
import com.shs.LibraryApplication.models.BaseResponse;
import com.shs.LibraryApplication.models.User;
import com.shs.LibraryApplication.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import static com.shs.LibraryApplication.constants.LibraryConstants.HOME_URL;
import static com.shs.LibraryApplication.constants.LibraryConstants.LOGIN_URL;

@Controller
@RequestMapping("/user")
public class UserController {
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public ModelAndView getUsersListPage(final ModelAndView model) {
        model.setViewName("users-list");
        return model;
    }

    @GetMapping("/edit")
    public ModelAndView getUsersEditPage(final ModelAndView model) {
        model.setViewName("users-edit");
        return model;
    }

    @RequestMapping(value = "/login")
    public ModelAndView getLoginPage(final ModelAndView model) {
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/signup")
    public ModelAndView getSignupPage(final ModelAndView model) {
        model.setViewName("signup");
        return model;
    }

    @PostMapping(value = "/registeriOXM5xKVYF")
    public ResponseEntity<User> saveUser(@RequestBody User user) throws Exception {

        return ResponseEntity.ok(userService.save(user));
    }

    @PostMapping(value = "/authenticate")
    public ResponseEntity<BaseResponse> createAuthenticationToken(@RequestBody User user) throws Exception {

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "token", HOME_URL));
    }

    @PostMapping(value = "/logout")
    public ResponseEntity<BaseResponse> logoutUser(HttpServletRequest request) {

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", LOGIN_URL));
    }
}
