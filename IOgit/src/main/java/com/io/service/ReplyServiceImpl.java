package com.io.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.io.mapper.BoardMapper;
import com.io.mapper.ReplyMapper;
import com.io.model.Criteria;
import com.io.model.ReplyPageDTO;
import com.io.model.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	private ReplyMapper mapper;
//	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
//		boardMapper.updateReplyCnt(vo.getBno(),1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int edit(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
