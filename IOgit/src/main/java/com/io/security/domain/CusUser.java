package com.io.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.io.model.UserVO;

import lombok.Getter;

@Getter
public class CusUser extends User {

	private static final long serialVersionUID = 1L;

	private UserVO user;

	public CusUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CusUser(UserVO vo) {

		super(vo.getUemail(), vo.getUpwd(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));

		this.user = vo;
	}
}
