package com.io.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void index() {
		log.info("왜 안오지?");
	}
	
	@GetMapping("/test")
	public void test() {
		TboardDTO dto = new TboardDTO();
		log.info("전체 글 보기" + bs.listGetBoard()); 
		
		
		dto.setCode("permit");
		log.info("temp 테이블 permit 일경우" + bs.listGetTBoard(dto));
		
		dto.setCode("reject");
		//bs.listPutBoard(dto);
		log.info("temp 테이블 jrect 일경우" + bs.listGetTBoard(dto));
		
		dto.setCode("ready");
		log.info("temp 테이블 ready 일경우" + bs.listGetTBoard(dto));
		
		dto.setCode(null);
		log.info("code가 널일경우 " + bs.listGetTBoard(dto));
		
		
		
		
	}
}
