package com.school.library.service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;

import java.util.List;

public interface BookDetailService {

    List<BookDetailsEntity> getBookDetails();
}
