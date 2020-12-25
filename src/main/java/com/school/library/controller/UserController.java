package com.school.library.controller;

import static com.school.library.constants.LibraryConstants.ADMIN_DASHBOARD_URL;
import static com.school.library.constants.LibraryConstants.LOGIN_TEMPLATE;
import static com.school.library.constants.LibraryConstants.LOGIN_URL;
import static com.school.library.constants.LibraryConstants.SIGNUP_TEMPLATE;
import static com.school.library.constants.LibraryConstants.USERS_LIST_TEMPLATE;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.school.library.enums.ResponseStatus;
import com.school.library.models.BaseResponse;
import com.school.library.models.User;

@Controller
@RequestMapping("/user")
public class UserController {
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

//    @Autowired
//    private UserService userService;

    @GetMapping("/list")
    public ModelAndView getUsersListPage(final ModelAndView model) {
        model.setViewName(USERS_LIST_TEMPLATE);
        return model;
    }

    @GetMapping("/edit")
    public ModelAndView getUsersEditPage(final ModelAndView model) {
        model.setViewName("users-edit");
        return model;
    }

    @RequestMapping(value = "/login")
    public ModelAndView getLoginPage(final ModelAndView model) {
        model.setViewName(LOGIN_TEMPLATE);
        return model;
    }

    @RequestMapping(value = "/signup")
    public ModelAndView getSignupPage(final ModelAndView model) {
        model.setViewName(SIGNUP_TEMPLATE);
        return model;
    }

//    @PostMapping(value = "/registeriOXM5xKVYF")
//    public ResponseEntity<User> saveUser(@RequestBody User user) throws Exception {
//
//        return ResponseEntity.ok(userService.save(user));
//    }

    @PostMapping(value = "/authenticate")
    public ResponseEntity<BaseResponse> createAuthenticationToken(@RequestBody User user) throws Exception {

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "token", ADMIN_DASHBOARD_URL));
    }

    @PostMapping(value = "/logout")
    public ResponseEntity<BaseResponse> logoutUser(HttpServletRequest request) {

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", LOGIN_URL));
    }
}
