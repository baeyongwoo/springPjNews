package com.io.controller;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.io.model.BoardDTO;
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
		  Map<String, List<BoardDTO>> boardMap = bs.listGetBoard();
		  log.info("boardMap" + boardMap);
		    model.addAttribute("boardMap", boardMap);
	}
	
	
	
}
