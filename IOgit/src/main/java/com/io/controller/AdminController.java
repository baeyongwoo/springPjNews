package com.io.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.io.model.TboardDTO;
import com.io.service.BoardService;
import com.io.service.TboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminController {

	@Autowired
	BoardService bs;
	
	@Autowired
	TboardService tbs;
	
	
	@GetMapping("/index")
	public void index(Model model) {
		//기사들 갯수
		 List<Map<String, Object>> codeCounts =bs.getsCountOfCode();
	        Map<String, String> tboardCount = new HashMap<>();
	        
	        for (Map<String, Object> codeCount : codeCounts) {
	            tboardCount.put((String) codeCount.get("code"), String.valueOf(codeCount.get("count")));
	        }

	        model.addAttribute("tboardCount", tboardCount);
	        
	        log.info("tcount code value : " + tboardCount);
		
		log.info("userlist log" + bs.listUserListOfPost());
		
		model.addAttribute("userList", bs.listUserListOfPost());
		
		
	}
	
	@GetMapping("/newsList")
	public void getCodeViewList(String code, Model model) {
		
		TboardDTO dto = new TboardDTO();
		
		dto.setCode(code);
		model.addAttribute("tboardList",bs.listGetTBoard(dto));
		log.info("boardList" + bs.listGetTBoard(dto));
		switch (code) {
			
		case "complete":
			model.addAttribute("code", "complete");
			
			break;
		case "permit":
			model.addAttribute("code", "permit");
			break;

		case "ready":
			model.addAttribute("code", "ready");			
			break;
		case "reject":
			model.addAttribute("code", "reject");
			break;

		default:
			break;
		}
		
	}
	
	@PostMapping(value="/updateData",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void getAttachList(Long tno, String code){
		log.info("tno value " + tno);
		log.info("code value " + code);
		TboardDTO dto = new TboardDTO();
		dto.setTno(tno);
		dto.setCode(code);
		
		
		tbs.changeCode(dto);
		
		
	}

	
	
	
}
