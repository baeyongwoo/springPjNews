//회원가입
package com.io.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.io.model.AuthVO;
import com.io.model.MypageDTO;
import com.io.model.UserDTO;
import com.io.security.SecurityService;
import com.io.service.MyPageService;
import com.io.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@RequiredArgsConstructor
@Log4j
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder pwen;

	@Autowired
	private SecurityService ss;

	@Autowired
	private MyPageService mypageService;

	@GetMapping("/mypage")
	public void myPage(HttpSession session, Model model) {
		String uemail = (String) session.getAttribute("username");

		List<MypageDTO> myPosts = mypageService.getMypagePosts(uemail);
		model.addAttribute("myPosts", myPosts);
		
		String logoutMessage = (String) session.getAttribute("logoutMessage");
	    if (logoutMessage != null) {
	        model.addAttribute("logoutMessage", logoutMessage);
	        session.removeAttribute("logoutMessage");
	        session.removeAttribute("username");
	    }
	    
	    model.addAttribute("username", session.getAttribute("username"));
	    model.addAttribute("loggedIn", session.getAttribute("username") != null); // 세션 상태 추가
	}

	// 회원가입
	@GetMapping("/join")
	public void joinForm() {

	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserDTO userDTO, String[] role) {
		userDTO.setUpwd(pwen.encode(userDTO.getUpwd()));
		log.info("회원가입정보 : " + userDTO+ "권한 : " + role);

		userDTO.setAuthList(new ArrayList<AuthVO>());

		for(int i = 0; i < role.length; i++) {
			userDTO.getAuthList().add(new AuthVO());
			userDTO.getAuthList().get(i).setAuthority(role[i]);
			userDTO.getAuthList().get(i).setUemail(userDTO.getUemail());
		}



		ss.insertUser(userDTO);

		return "redirect:/user/login";

	}


	@GetMapping(value="/findUser")
	@ResponseBody
	public String joinForm(String uemail) {
		log.info("find email" + userService.getUserByEmail(uemail));

		String response = (userService.getUserByEmail(uemail) == null) ? "useable" :"non-useable";
		return response;



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

	//에러페이지
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("권한없음 : "+auth);
		model.addAttribute("msg", "권한이 없습니다.");
	}
	//커스텀로그인
	@GetMapping("/login")
	public void loginInput(String error,String logout,Model model) {
		//UserVO login_session = (UserVO)session.getAttribute("login_session");
		//		userDto.setUemail()
		log.info("error" + error);
		log.info("logout" + logout);
		if(error!=null) {
			model.addAttribute("error", "로그인 에러");
		}
		if(logout!=null) {
			model.addAttribute("logout", "로그아웃되었습니다.");
		}
	}


	@PostMapping("/login")
	public void loginInputData(String username, String password) {
		log.info("loginpost");
		UserDTO dto = new UserDTO();
		dto.setUemail(username);
		dto.setUpwd(password);


	}

	@GetMapping("/logout")
	public String logoutForm(Model model, HttpSession session) {
		session.setAttribute("logoutMessage", "로그아웃되었습니다.");
		return "redirect:/board/list";
	}




	//커스텀로그아웃화면
	@GetMapping("/list")
	public void logoutGET() {}
	//커스텀로그아웃처리
	@PostMapping("/list")
	public void logoutPost() {}

}
