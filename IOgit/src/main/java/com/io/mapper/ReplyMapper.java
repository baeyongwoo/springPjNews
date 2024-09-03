package com.io.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.io.model.Criteria;
import com.io.model.ReplyVO;

public interface ReplyMapper {
	//댓글등록
    public int insert(ReplyVO vo);
    //댓글목록
    public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
    //댓글갯수
    public int getCountByBno(Long bno);
    //댓글상세
    public ReplyVO read(Long rno);
    //댓글수정
    public int update(ReplyVO vo);
    //댓글삭제
    public int delete(@Param("rno") Long rno, @Param("rpwd") String rpwd);
}