package com.school.library.service;

import java.io.FileReader;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.opencsv.CSVReader;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.repository.BookRepository;

@Service
public class UtilityService {

    static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

    @Autowired
    private BookRepository bookRepository;
    
    public void addBulkBookDetails(MultipartFile file) {
    	System.out.println(file.getName());
    	System.out.println(file.getOriginalFilename());
    	//readDataLineByLine(file.getName());
    }

    private void readDataLineByLine(String file) {

        ArrayList<String[]> allLines = new ArrayList<>();
        try {
            FileReader filereader = new FileReader(file);
            CSVReader csvReader = new CSVReader(filereader);
            String[] line;

            while ((line = csvReader.readNext()) != null) {
                allLines.add(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        populateBookDetails(allLines);
    }

    private void populateBookDetails(final ArrayList<String[]> allLines) {

        final List<BookEntity> bookEntities = new ArrayList<>();
        allLines.forEach(line -> {
            final BookDetailsEntity bookDetails = new BookDetailsEntity();
            bookDetails.setName(line[1]);
            bookDetails.setPublication(line[3]);
            bookDetails.setCategory(line[4]);
            bookDetails.setLanguage(line[5]);
            bookDetails.setCreatedTimestamp(new Date());
            try {
                final BookEntity bookEntity = new BookEntity();
                bookEntity.setId(line[0]);
                bookEntity.setContributedBy("");
                bookEntity.setPrice(new BigDecimal(line[8]));
                bookEntity.setRack(line[6]);
                bookEntity.setStatus("");
                bookEntity.setPurchasedDate(formatter.parse("01/01/2019"));
                bookEntity.setCreatedTimestamp(new Date());
                bookEntity.setUpdatedTimestamp(new Date());
                bookEntity.setUsers(new ArrayList<>());
                bookEntity.setBookDetails(bookDetails);
                bookEntities.add(bookEntity);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        bookRepository.saveAll(bookEntities);
    }
}
