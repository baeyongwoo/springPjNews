package com.informationocean.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.informationocean.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public String test() {
		log.info("test!!" +  service.testCheck());
		return "redirect:/index.jsp";
	}
	
	
	
}
