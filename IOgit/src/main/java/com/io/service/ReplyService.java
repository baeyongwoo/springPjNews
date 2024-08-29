package com.io.service;

import com.io.model.Criteria;
import com.io.model.ReplyPageDTO;
import com.io.model.ReplyVO;

public interface ReplyService {
	//댓글등록
	public int register(ReplyVO vo);
	//댓글목록
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	//댓글상세
	public ReplyVO get(Long rno);
	//댓글수정
	public int edit(ReplyVO vo);
	//댓글삭제
	public int remove(Long rno);
}
