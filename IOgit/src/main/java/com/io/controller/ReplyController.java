package com.io.controller;

import java.io.BufferedReader;
import java.io.FileReader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.io.model.Criteria;
import com.io.model.ReplyPageDTO;
import com.io.model.ReplyVO;
import com.io.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	//댓글등록
	@PostMapping(value="/new",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		int insertCount=service.register(vo);
		
		return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK)
								: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글목록
	@GetMapping(value="/pages/{bno}/{page}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno){
		Criteria cri=new Criteria(page,10);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	//댓글상세
	@GetMapping(value="/{rno}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	//댓글수정
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
			value="/{rno}",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,@PathVariable("rno") Long rno){
		vo.setRno(rno);
		
		return service.edit(vo)==1 ? new ResponseEntity<>("success",HttpStatus.OK) :
									 new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글삭제
	@DeleteMapping(value="/{rno}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo,@PathVariable("rno") Long rno){
		return service.remove(rno)==1 ? new ResponseEntity<>("success",HttpStatus.OK) :
										new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//js파일 로딩
	@GetMapping(value="/js",produces= {MediaType.TEXT_PLAIN_VALUE})
	public String getJS(Long bno,HttpServletRequest request) {
		BufferedReader reader=null;
		String script="";
		try {
			String filePath=request.getRealPath("/resources/js/reply.js");
			reader=new BufferedReader(new FileReader(filePath));
			script+="var bnoValue='"+bno+"'\n;";
			while(true) {
				String str=reader.readLine();
				if(str==null)
					break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				reader.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return script;
	}
	
	
}