package com.school.library.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.school.library.entity.AuthorEntity;
import com.school.library.entity.BookDetailsEntity;
import com.school.library.entity.BookEntity;
import com.school.library.repository.BookDetailsRepository;
import com.school.library.repository.BookRepository;

@Service
public class UtilityService {

	static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private BookDetailsRepository bookDetailsRepository;

	public void addBulkBookDetails(MultipartFile file) {
		List<LibraryCsv> librayBooks = null;
		try (Reader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
			CsvToBean<LibraryCsv> csvToBean = new CsvToBeanBuilder(reader).withType(LibraryCsv.class)
					.withIgnoreLeadingWhiteSpace(true).build();
			librayBooks = csvToBean.parse();
		} catch (Exception e) {
			System.out.println("########## EXCEPTION #############: " + e.getMessage());
		}

		if (CollectionUtils.isEmpty(librayBooks)) {
			System.out.println("Bean parsing failed");
			return;
		}

		Map<String, List<LibraryCsv>> authorBookMap = librayBooks.stream().collect(Collectors.groupingBy(LibraryCsv::getAuthorName));
		Set<String> authorNames = authorBookMap.keySet();

		authorNames.forEach(authorName -> {
			AuthorEntity authorEntity = new AuthorEntity(authorName);
			System.out.println("------ Author: " + authorName);

			List<LibraryCsv> authorsBooks = authorBookMap.get(authorName);
			Map<String, List<LibraryCsv>> bookMap = authorsBooks.stream().collect(Collectors.groupingBy(LibraryCsv::getBookName));
			Set<String> bookNames = bookMap.keySet();

			bookNames.forEach(bookName -> {
				List<LibraryCsv> booksItems = bookMap.get(bookName);

				LibraryCsv booksItem = booksItems.get(0);
				BookDetailsEntity bookDetailsEntity = new BookDetailsEntity(booksItem.getBookName(),
						booksItem.getPublication(), booksItem.getCategory(), booksItem.getLanguage(), new Date(),
						authorEntity);
				BookDetailsEntity savedBookDetails = bookDetailsRepository.save(bookDetailsEntity);

				System.out.println(bookName + " : " + booksItems.stream().map(LibraryCsv::getBookId).collect(Collectors.toList()));
				List<BookEntity> bookEntities = booksItems.stream()
						.map(x -> new BookEntity(x.getBookId(), "library",
								new BigDecimal(Objects.toString(x.getPrice(), "0")), Objects.toString(x.getRack(), ""),
								"AVAILABLE", new Date(), new Date(), new Date(), savedBookDetails))
						.collect(Collectors.toList());

				bookRepository.saveAll(bookEntities);
			});
		});
	}
}
