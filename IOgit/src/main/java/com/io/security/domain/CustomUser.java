package com.io.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.io.model.UserDTO;

import lombok.Getter;


@Getter
public class CustomUser extends User{
	
	private UserDTO user;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);		
	}
	
	//생성자오버로딩
	public CustomUser(UserDTO dto) {
		//부모클래스 생성자호출
		super(dto.getUemail(), dto.getUpwd(), dto.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));

		
		this.user=dto;
	}
	
	

}
