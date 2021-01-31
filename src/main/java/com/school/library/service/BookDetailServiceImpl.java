package com.school.library.service;

import com.school.library.entity.BookDetailsEntity;
import com.school.library.repository.BookDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookDetailServiceImpl implements BookDetailService {

    @Autowired
    private BookDetailsRepository bookDetailsRepository;

    @Override
    public List<BookDetailsEntity> getBookDetails() {
        return bookDetailsRepository.findAll();
    }

}
