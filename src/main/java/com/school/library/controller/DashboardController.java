package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.school.library.service.DashboardService;

@Controller
@RequestMapping("/admin")
public class DashboardController {

	public static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

	@Autowired
	private DashboardService dashboardService;

	@GetMapping("/dashboard")
	public String dashboardPage(Model model) {

		model.addAttribute("bookreq", dashboardService.getAllActionRequiredBooks());
		model.addAttribute("userreq", dashboardService.getAllRegisteredUsers());
		return "admin-dashboard";
	}
}
