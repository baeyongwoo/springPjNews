//회원가입
package com.io.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Autowired
	private UserService userService;

	// 회원가입
	@GetMapping("/join")
	public void joinForm() {

	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserDTO userDTO) {
		int joinResult = userService.join(userDTO);
		if (joinResult > 0) {
			return "redirect:/board/list";
		} else {

			return "redirect:/user/join";
		}
	}

	/*
	 * // 회원정보수정
	 * 
	 * @GetMapping("/update") public void userupdateForm(String uemail, Model model)
	 * { UserDTO user = userService.updateuser(uemail); model.addAttribute("user",
	 * user); }
	 * 
	 * @PostMapping("/update") public String userupdateForm(@ModelAttribute UserDTO
	 * userDTO) { userService.updateUser(userDTO); int userupdateResult =
	 * userService.updateuser(userDTO); if (userupdateResult > 0) { return
	 * "redirect:/board/list"; } else { return "redirect:/user/update"; } }
	 */
	
}
