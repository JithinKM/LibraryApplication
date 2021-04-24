package com.school.library.controller;

import com.school.library.entity.AuthorEntity;
import com.school.library.model.Author;
import com.school.library.service.AuthorService;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import static com.school.library.constants.LibraryConstants.AUTHOR_DETAIL_TEMPLATE;

@Controller
@RequestMapping("/author")
public class AuthorController {

    public static final Logger logger = LoggerFactory.getLogger(AuthorController.class);

    @Autowired
    private AuthorService authorService;
    
    @GetMapping
    public String getAuthorsListPage(Model model) {
        model.addAttribute("authors", authorService.getAuthors());
        return "authors-list";
    }

    @PostMapping
    public String createAuthor(@RequestBody Author author) {
        authorService.createAuthor(author);
        return "authors-list";
    }

    @DeleteMapping("/{id}")
    public String deleteAuthor(@PathVariable Long id) {
        authorService.deleteAuthor(id);
        return "authors-list";
    }

    @PutMapping
    public String editAuthor(@RequestBody Author author) {
        authorService.createAuthor(author);
        return "authors-list";
    }

    @GetMapping("/all/{query}")
    public List<AuthorEntity> getAuthors(@PathVariable("query") String name) {

        return authorService.getAuthors(name);
    }

    @GetMapping("/{id}")
    public ModelAndView getAuthor(@PathVariable("id") Long id,  final ModelAndView model) {

        final AuthorEntity author = authorService.getAuthor(id);
        model.addObject("author", author);
        model.setViewName(AUTHOR_DETAIL_TEMPLATE);
        return model;
    }
}
