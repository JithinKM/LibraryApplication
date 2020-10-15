package com.shs.LibraryApplication.controller;

import com.shs.LibraryApplication.enums.ResponseStatus;
import com.shs.LibraryApplication.models.Author;
import com.shs.LibraryApplication.models.BaseResponse;
import com.shs.LibraryApplication.service.AuthorService;
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

import java.util.List;

import static com.shs.LibraryApplication.constants.LibraryConstants.AUTHOR_LIST_URL;

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

        authorService.createAuthor(request);
        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", AUTHOR_LIST_URL));
    }

    @GetMapping("/list")
    public ModelAndView getAuthorsListPage(final ModelAndView model) {

        final List<Author> authors = authorService.getAuthors();
        model.addObject("authors", authors);
        model.setViewName("authors-list");

        return model;
    }

    @GetMapping("/{id}/delete")
    public ModelAndView deleteAuthor(@PathVariable("id") String id,  final ModelAndView model) {

        authorService.deleteAuthor(id);
        final List<Author> authors = authorService.getAuthors();
        model.addObject("authors", authors);
        model.setViewName("authors-list");
        return model;
    }

    @PostMapping("/edit")
    public ResponseEntity<BaseResponse> getAuthorsEditPage(@RequestBody final Author request) {

        authorService.updateAuthor(request);
        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", AUTHOR_LIST_URL));
    }

}
