package com.io.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.io.model.Criteria;
import com.io.model.ReplyPageDTO;
import com.io.model.ReplyVO;
import com.io.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/*")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	@Autowired
    private ReplyService service;
    //등록
    @PostMapping(value="/new", consumes= {MediaType.APPLICATION_JSON_VALUE}, produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
        try {
            int insertCount = service.register(vo);
            return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.CREATED) 
                                    : new ResponseEntity<>("Failed to insert reply", HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            log.error("Error creating reply", e);
            return new ResponseEntity<>("Error creating reply", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    //목록
    @GetMapping(value="/pages/{bno}/{page}", produces= {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bno") Long bno, @PathVariable("page") int page) {
        try {
            Criteria cri = new Criteria(page, 10);
            ReplyPageDTO replyPage = service.getListPage(cri, bno);
            return replyPage != null ? new ResponseEntity<>(replyPage, HttpStatus.OK)
                                     : new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            log.error("Error fetching replies", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	// 수정
    @RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
                    value="/{rno}", consumes= {MediaType.APPLICATION_JSON_VALUE}, produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {
        try {
            vo.setRno(rno);
            int updateCount = service.edit(vo);
            return updateCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                                    : new ResponseEntity<>("Failed to update reply", HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            log.error("Error updating reply", e);
            return new ResponseEntity<>("Error updating reply", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    //삭제
    @DeleteMapping(value="/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno, @RequestBody(required = false) String rpwd) {
        try {
            int deleteCount = service.remove(rno, rpwd);
            return deleteCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                                    : new ResponseEntity<>("Failed to delete reply", HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            log.error("Error deleting reply", e);
            return new ResponseEntity<>("Error deleting reply", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
