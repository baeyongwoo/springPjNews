//회원가입
package com.io.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/update")
    public String userUpdateForm(@RequestParam("uemail") String uemail, Model model) {
        UserDTO user = userService.getUserByEmail(uemail);
        model.addAttribute("user", user);
        return "user/update"; // 회원정보수정 페이지로 이동
    }

    // 회원정보수정 처리
    @PostMapping("/update")
    public String userUpdate(@ModelAttribute UserDTO userDTO) {
        int userUpdateResult = userService.updateuser(userDTO);
        if (userUpdateResult > 0) {
            return "redirect:/board/list"; // 성공 시 게시판 목록으로 리다이렉트
        } else {
            return "redirect:/user/update"; // 실패 시 다시 회원정보수정 페이지로 리다이렉트
        }
    }
    // 회원탈퇴 처리
    @PostMapping("/delete")
    public String deleteUser(@RequestParam("uemail") String uemail) {
        userService.remove(uemail);
        return "redirect:/user/join"; // 탈퇴 후 회원가입 페이지로 리다이렉트
    }
	
}
