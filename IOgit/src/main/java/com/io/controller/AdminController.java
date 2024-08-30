package com.io.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.io.model.TboardDTO;
import com.io.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminController {

	@Autowired
	BoardService bs;
	
	
	@GetMapping("/index")
	public void index(Model model) {
		log.info("index count Code " + bs.getsCountOfCode());
		//기사들 갯수
		model.addAttribute("tboardCount", bs.getsCountOfCode());
		model.addAttribute("userList", bs.listUserListOfPost());
	}
	
	@GetMapping("/board")
	public void getCodeViewList(String code) {
		
		TboardDTO dto = new TboardDTO();
		
		dto.setCode(code);
		
		log.info("입력받은 code에 따라 리스트값들" +bs.listGetTBoard(dto)) ;
		
		
		
	}
}
