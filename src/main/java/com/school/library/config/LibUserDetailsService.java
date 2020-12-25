package com.school.library.config;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.school.library.entity.RoleEntity;
import com.school.library.entity.UserEntity;
import com.school.library.exception.UserNotValidException;
import com.school.library.repository.UserRepository;

public class LibUserDetailsService implements UserDetailsService {

	@Autowired
	UserRepository userRepository;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) {
		System.out.println("loadingusers.......................");
		UserEntity user = Optional.ofNullable(userRepository.findByUsername(username))
				.orElseThrow(() -> new UsernameNotFoundException("User not found"));
		List<GrantedAuthority> authorities = getUserAuthority(user.getRoles());
		if (!user.isActive()) {
			throw new UserNotValidException(user.getStatus(), "User is not valid");
		}
		return buildUserForAuthentication(user, authorities);
	}

	private List<GrantedAuthority> getUserAuthority(Set<RoleEntity> userRoles) {
		return userRoles.parallelStream().map(x -> new SimpleGrantedAuthority(x.getRole()))
				.collect(Collectors.toList());
	}

	private UserDetails buildUserForAuthentication(UserEntity user, List<GrantedAuthority> authorities) {
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), true, true,
				true, true, authorities);
	}

}
