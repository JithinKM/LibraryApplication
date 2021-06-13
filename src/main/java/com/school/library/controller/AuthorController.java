package com.school.library.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.school.library.model.Author;
import com.school.library.service.AuthorService;

@Controller
@RequestMapping("/author")
public class AuthorController {

    public static final Logger logger = LoggerFactory.getLogger(AuthorController.class);

    @Autowired
    private AuthorService authorService;
    
    @GetMapping
    public String getAuthorsListPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
    	if (StringUtils.isNotBlank(keyword)) {
			model.addAttribute("authors", authorService.searchAuthors(keyword));
			model.addAttribute("keyword", keyword);
			return "authors-list";
		}
    	
        model.addAttribute("authors", authorService.getDefaultAuthors());
        return "authors-list";
    }

    @PostMapping
    public String createAuthor(Author author, Model model) {
        authorService.createAuthor(author);
        return "redirect:/author";
    }
    
    @PutMapping
    public String updateAuthor(Author author, Model model) {
        authorService.updateAuthor(author);
        return "redirect:/author";
    }
    
    @DeleteMapping("/id/{id}")
    public String deleteAuthor(@PathVariable Long id) {
        authorService.deleteAuthorById(id);
        return "authors-list";
    }

   
    
    
    
    
    
//    @GetMapping("/id/{id}")
//    @ResponseBody
//    public AuthorEntity getAuthor(@PathVariable("id") Long id, Model model) {
//        return authorService.getAuthorById(id);
//    }
//    
//    @GetMapping("/all/{name}")
//    @ResponseBody
//    public List<AuthorEntity> getAuthorsByName(@PathVariable("name") String name) {
//        return authorService.getAuthorsByName(name);
//    }
}
