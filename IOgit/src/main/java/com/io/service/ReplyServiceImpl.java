package com.io.service;

import org.springframework.stereotype.Service;

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
    private final ReplyMapper mapper;

    @Override
    public int register(ReplyVO vo) {
        return mapper.insert(vo);
    }

    @Override
    public ReplyPageDTO getListPage(Criteria cri, Long bno) {
        return new ReplyPageDTO(
                mapper.getListWithPaging(cri, bno),
                mapper.getCountByBno(bno)
        );
    }

    @Override
    public int edit(ReplyVO vo) {
        return mapper.update(vo);
    }

    @Override
    public int remove(Long rno, String rpwd) {
        return mapper.delete(rno, rpwd);
    }
}

