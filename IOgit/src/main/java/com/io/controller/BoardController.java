package com.io.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.io.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService bs;
	
	@GetMapping("/list")
	public void list(Model model ) {
		
		log.info("view쪽으로 보낼 데이터 " + bs.listGetBoard());
		model.addAttribute("board",  bs.listGetBoard());
	}
	
	
	
}
