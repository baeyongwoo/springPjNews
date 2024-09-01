package com.io.mapper;

<<<<<<< HEAD
import com.io.model.UserVO;

public interface UserMapper {

	public UserVO read(String uemail);
=======

import com.io.model.UserDTO;

public interface UserMapper {
	public int join(UserDTO user); 
	
	public void deleteUser(String uemail);
>>>>>>> origin/develop
}
