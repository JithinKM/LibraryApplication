package com.school.library.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class ApplicationConfiguration {

	@Bean
	public RestTemplate restTemplate() {
	    return new RestTemplate();
	}
	
	@Bean
	public LocaleResolver localeResolver() {
	    SessionLocaleResolver slr = new SessionLocaleResolver();
	    slr.setDefaultLocale(Locale.forLanguageTag("ml-IN"));
	    return slr;
	}
	
	@Bean(name = "messageSource")
	public MessageSource getMessageSource() {
		System.out.println("Current Locale: ");
		CustomMessageSource messageSource = new CustomMessageSource();
		messageSource.setBasename("classpath:messages");
		messageSource.setCacheSeconds(60);
		messageSource.setFallbackToSystemLocale(false);
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}
}
