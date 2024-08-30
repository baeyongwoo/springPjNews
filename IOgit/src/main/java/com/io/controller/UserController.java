//회원가입
package com.io.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.io.model.UserDTO;
import com.io.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user/*")
@RequiredArgsConstructor

public class UserController {

	private final UserService userService;
	
	@GetMapping("/join")
	public void joinForm() {
		
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserDTO userDTO) {
		int joinResult=userService.join(userDTO);
		if(joinResult>0) {
			 return "redirect:/board/list";
		}else {
			  
	            return "redirect:/user/join";
		}
	}
}
