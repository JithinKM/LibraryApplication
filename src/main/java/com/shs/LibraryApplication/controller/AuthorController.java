package com.shs.LibraryApplication.controller;

import com.shs.LibraryApplication.models.AuthorCreationRequest;
import com.shs.LibraryApplication.models.AuthorCreationResponse;
import com.shs.LibraryApplication.service.AuthorService;
import com.shs.LibraryApplication.enums.ResponseStatus;
import com.shs.LibraryApplication.models.BaseResponse;
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
    public ResponseEntity<BaseResponse> createAuthor(@RequestBody final AuthorCreationRequest request) {

        authorService.createAuthor(request);

        return ResponseEntity.ok(new BaseResponse(ResponseStatus.SUCCESS, "", AUTHOR_LIST_URL));
    }

    @GetMapping("/list")
    public ModelAndView getAuthorsListPage(final ModelAndView model) {
        model.setViewName("authors-list");
        return model;
    }

    @GetMapping("/edit")
    public ModelAndView getAuthorsEditPage(final ModelAndView model) {
        model.setViewName("authors-edit");
        return model;
    }

    /**
     * Get author information by name.
     *
     * @return author information
     */
    @GetMapping("/{name}")
    public AuthorCreationResponse getAuthor(@PathVariable(value = "name") String name) {

        return null;
    }

}
