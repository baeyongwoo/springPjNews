package com.io.model;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class UserVO {
	private String uemail;
	private String upwd;
	private String uname;
	private String did;
	private List<AuthVO> authList;
}
