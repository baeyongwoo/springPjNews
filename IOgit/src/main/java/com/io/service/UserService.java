package com.io.service;

import com.io.model.UserDTO;

public interface UserService {
	
	//가입
	public int join(UserDTO user);
	
	//탈퇴
	public void remove(String uemail);

}
