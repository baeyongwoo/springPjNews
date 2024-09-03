package com.io.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.io.mapper.UserMapper;
import com.io.model.UserDTO;
import com.io.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private UserMapper userMapper; //주입

	// 회원 아이디로 회원정보 조회
	@Override
	public UserDetails loadUserByUsername(String uemail) throws UsernameNotFoundException {
		UserDTO dto=userMapper.selectUser(uemail);
		log.info("유저이름확인" + uemail);
		return dto==null ? null : new CustomUser(dto);
	}

}
