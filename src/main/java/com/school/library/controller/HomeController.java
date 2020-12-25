package com.school.library.controller;

import static com.school.library.constants.LibraryConstants.ADMIN_DASHBOARD_TEMPLATE;
import static com.school.library.constants.LibraryConstants.HOME_PAGE_TEMPLATE;
import static com.school.library.constants.LibraryConstants.LOGIN_TEMPLATE;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    public static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value = "/")
    public ModelAndView getHomePage(final ModelAndView model) {
        model.setViewName(HOME_PAGE_TEMPLATE);
        return model;
    }

    @RequestMapping(value = "/admin")
    public ModelAndView getAdminDashboardPage(final ModelAndView model) {
        model.setViewName(ADMIN_DASHBOARD_TEMPLATE);
        return model;
    }

    @RequestMapping(value = "/login")
    public String getLoginPage() {
        return "login";
    }

}
