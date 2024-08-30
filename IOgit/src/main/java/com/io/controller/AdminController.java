package com.io.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		 List<Map<String, Object>> codeCounts =bs.getsCountOfCode();
	        Map<String, String> tboardCount = new HashMap<>();
	        
	        for (Map<String, Object> codeCount : codeCounts) {
	            tboardCount.put((String) codeCount.get("code"), String.valueOf(codeCount.get("count")));
	        }

	        model.addAttribute("tboardCount", tboardCount);
		
		
		
		
		model.addAttribute("userList", bs.listUserListOfPost());
		
		
	}
	
	@GetMapping("/board")
	public void getCodeViewList(String code) {
		
		TboardDTO dto = new TboardDTO();
		
		dto.setCode(code);
		
		log.info("입력받은 code에 따라 리스트값들" +bs.listGetTBoard(dto)) ;
		
		
		
	}
}
