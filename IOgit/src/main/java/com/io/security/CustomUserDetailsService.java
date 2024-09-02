package com.io.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.io.mapper.UserMapper;
import com.io.model.UserDTO;
import com.io.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_ = {@Autowired})
	private UserMapper userMapper; //주입

	// 회원 아이디로 회원정보 조회
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		UserDTO dto=userMapper.read(userName);
		
		return dto==null ? null : new CustomUser(dto);
	}

}
