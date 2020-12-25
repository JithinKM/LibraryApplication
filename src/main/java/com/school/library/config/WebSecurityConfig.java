package com.school.library.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

//    @Autowired
//    private CustomRequestFilter requestFilter;
    
    @Bean
    public UserDetailsService userDetailsService() {
      return new LibUserDetailsService();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        httpSecurity
                .csrf().disable()
                .authorizeRequests()
                	.antMatchers("/", "/login", "/signup", "/js/**", "/css/**", "/img/**").permitAll()
                	.anyRequest().authenticated()
                	.and()
                .formLogin()
                	.loginPage("/login")
                	.and()
                .logout()
                	.permitAll()
                	.and()
                .exceptionHandling()
                	.accessDeniedPage("/403")
                ;
        
        //httpSecurity.addFilterAfter(requestFilter, BasicAuthenticationFilter.class);
    }
    
//    @Bean
//    @Override
//    protected UserDetailsService userDetailsService() {
//    	UserDetails user = User.withDefaultPasswordEncoder()
//    							.username("admin")
//    							.password("admin")
//    							.roles("ADMIN")
//    							.build();
//    	return new InMemoryUserDetailsManager(user);
//    }

}