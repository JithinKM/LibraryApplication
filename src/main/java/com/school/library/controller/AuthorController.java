package com.school.library.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.school.library.enums.ResponseStatus;
import com.school.library.models.Author;
import com.school.library.models.BaseResponse;
import com.school.library.service.AuthorService;

import static com.school.library.constants.LibraryConstants.AUTHORS_LIST_TEMPLATE;
import static com.school.library.constants.LibraryConstants.AUTHOR_DETAIL_TEMPLATE;
import static com.school.library.constants.LibraryConstants.AUTHOR_LIST_URL;

import java.util.List;

@RestController
@RequestMapping("/author")
public class AuthorController {

    public static final Logger logger = LoggerFactory.getLogger(AuthorController.class);

    @Autowired
    private AuthorService authorService;

    /**
     * Create a new author.
     *
     * @param request input parameter of create author
     * @return created author information
     */
    @PostMapping("/add")
    public ResponseEntity<BaseResponse> createAuthor(@RequestBody final Author request) {

        try {
            authorService.createAuthor(request);
        } catch (Exception exception) {
            return ResponseEntity.ok(new BaseResponse(ResponseStatus.ERROR, "", exception.getMessage()));
        }

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", AUTHOR_LIST_URL));
    }

    @GetMapping("/list")
    public ModelAndView getAuthorsListPage(final ModelAndView model) {

        final List<Author> authors = authorService.getAuthors();
        model.addObject("authors", authors);
        model.setViewName(AUTHORS_LIST_TEMPLATE);

        return model;
    }

    @GetMapping("/all/{query}")
    public List<Author> getAuthors(@PathVariable("query") String name) {

        return authorService.getAuthors(name);
    }

    @GetMapping("/{id}")
    public ModelAndView getAuthor(@PathVariable("id") String id,  final ModelAndView model) {

        final Author author = authorService.getAuthor(id);
        model.addObject("author", author);
        model.setViewName(AUTHOR_DETAIL_TEMPLATE);
        return model;
    }

    @GetMapping("/{id}/delete")
    public ModelAndView deleteAuthor(@PathVariable("id") String id,  final ModelAndView model) {

        authorService.deleteAuthor(id);
        final List<Author> authors = authorService.getAuthors();
        model.addObject("authors", authors);
        model.setViewName(AUTHORS_LIST_TEMPLATE);
        return model;
    }

    @PostMapping("/edit")
    public ResponseEntity<BaseResponse> editAuthor(@RequestBody final Author request) {

        try {
            authorService.updateAuthor(request);
        } catch (Exception exception) {
            return ResponseEntity.ok(new BaseResponse(ResponseStatus.ERROR, "", exception.getMessage()));
        }

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", AUTHOR_LIST_URL));
    }

}
