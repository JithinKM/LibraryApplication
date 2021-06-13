package com.school.library.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.school.library.service.impl.UtilityService;

@RestController
@RequestMapping("/utility")
public class UtilityController {

	public static final Logger logger = LoggerFactory.getLogger(UtilityController.class);

	@Autowired
	private UtilityService utilityService;

	@PostMapping(value = "/upload", consumes = "multipart/form-data", produces = "application/json")
	public String uploadBooksCsv(@RequestParam("file") MultipartFile file) throws IOException {
		utilityService.addBulkBookDetails(file);
		return "success";
	}

}
