package com.io.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.io.mapper.UserMapper;
import com.io.model.UserDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;
	
	@Override
	public int join(UserDTO user) {
		 
		return mapper.join(user);
		
	}


	@Override
	public void remove(String uemail) {
		log.info("delete email" + uemail);
		mapper.deleteUser(uemail);
	}
		
	
}
