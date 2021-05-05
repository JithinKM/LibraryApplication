package com.school.library.service;

import com.opencsv.CSVReader;
import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.repository.BookRepository;
import org.apache.commons.text.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

@Service
public class UtilityService {

    static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

    @Autowired
    private BookRepository bookRepository;

    public void addBulkBookDetails(MultipartFile file) {
        System.out.println(file.getName());
        System.out.println(file.getOriginalFilename());
        readDataLineByLine(file);
    }

    private void readDataLineByLine(MultipartFile file) {

        ArrayList<String[]> allLines = new ArrayList<>();
        try {
            InputStreamReader inputStreamReader = new InputStreamReader(file.getInputStream());
            CSVReader csvReader = new CSVReader(inputStreamReader);
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

        final char[] delimiters = { ' ', '_' };
        allLines.forEach(line -> {
            final BookDetailsEntity bookDetails = new BookDetailsEntity();
            bookDetails.setName(WordUtils.capitalizeFully(line[1], delimiters));
            bookDetails.setPublication(WordUtils.capitalizeFully(line[3], delimiters));
            bookDetails.setCategory(WordUtils.capitalizeFully(line[4], delimiters));
            bookDetails.setLanguage(WordUtils.capitalizeFully(line[5], delimiters));
            bookDetails.setCreatedTimestamp(new Date());
            AuthorEntity authorEntity = new AuthorEntity();
            authorEntity.setName(WordUtils.capitalizeFully(line[2], delimiters));
            authorEntity.setPenName(WordUtils.capitalizeFully(line[2], delimiters));
            bookDetails.setAuthor(authorEntity);
            try {
                final BookEntity bookEntity = new BookEntity();
                bookEntity.setId(WordUtils.capitalizeFully(line[0], delimiters));
                bookEntity.setContributedBy("");
                bookEntity.setPrice(new BigDecimal(line[8]));
                bookEntity.setRack(line[6]);
                bookEntity.setStatus("AVAILABLE");
                bookEntity.setPurchasedDate(formatter.parse("01/01/2019"));
                bookEntity.setCreatedTimestamp(new Date());
                bookEntity.setUpdatedTimestamp(new Date());
                bookEntity.setUsers(new ArrayList<>());
                bookEntity.setBookDetails(bookDetails);

                bookRepository.save(bookEntity);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
}
