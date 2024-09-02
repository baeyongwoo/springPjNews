package com.io.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class UserDTO {
	private String uemail;
	private String upwd;
	private String uname;
	private String did;
	private String dname;
	public Collection<? extends GrantedAuthority> getAuthList() {
		// TODO Auto-generated method stub
		return null;
	}
}
