package com.io.service;

import org.springframework.stereotype.Service;
import com.io.mapper.UserMapper;
import com.io.model.UserDTO;


@Service

public class UserServiceImpl implements UserService{
	
	
	private UserMapper mapper;
    public UserServiceImpl(UserMapper mapper) {
        this.mapper = mapper;
    }
	
	
	@Override
	public int join(UserDTO user) {
		 
		return mapper.join(user);
		
	}
		
	
}
