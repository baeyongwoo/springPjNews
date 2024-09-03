package com.io.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/test/*")
@Controller
public class SecurityController {
	//모든 사용자 접근
	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사용자 접근가능");		
	}
	//Member접근
	@GetMapping("/board/post")
	public void doMember() {
		log.info("member 접근가능");
	}
	//admin접근
	@GetMapping("/admin/*")
	public void doAdmin() {
		log.info("amdin 접근가능");
	}
	
}