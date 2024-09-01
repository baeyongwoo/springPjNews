package com.io.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.io.mapper.UserMapper;
import com.io.model.UserVO;
import com.io.security.domain.CusUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CusUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userName);

		// userName means userid
		UserVO vo = userMapper.read(userName);

		log.warn("queried by member mapper: " + vo);

		return vo == null ? null : new CusUser(vo);
	} 

}
