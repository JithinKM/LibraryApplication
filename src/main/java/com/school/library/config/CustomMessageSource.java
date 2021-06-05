package com.school.library.config;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import org.springframework.context.support.ReloadableResourceBundleMessageSource;

public class CustomMessageSource extends ReloadableResourceBundleMessageSource {

	public List<Object> getAllKeys(Locale locale) {
		return Arrays.asList(getAllProperties(locale).keySet().toArray());
	}

	private Properties getAllProperties(Locale locale) {
		clearCacheIncludingAncestors();
		ReloadableResourceBundleMessageSource.PropertiesHolder propertiesHolder = getMergedProperties(locale);
		return propertiesHolder.getProperties();
	}
}
