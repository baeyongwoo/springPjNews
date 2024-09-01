package com.io.mapper;


import com.io.model.UserDTO;

public interface UserMapper {
	public int join(UserDTO user); 
	
	public void deleteUser(String uemail);
}
