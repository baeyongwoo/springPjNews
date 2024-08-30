package com.io.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.io.model.BoardDTO;
import com.io.model.TboardDTO;
import com.io.model.UserVO;

public interface BoardMapper {
	public List<BoardDTO> selectAllBoard();
	
	//스케줄위한 메서드
	public List<TboardDTO> selectAllTempBoard(TboardDTO tdto);
	
	public void insertBoards(@Param("list") List<TboardDTO> tdto);

	
	public void updateBoardCode(TboardDTO tdto);
	
	public void updatePermitToComplete();
	//스케줄 관련 메서드 끝
	
	//adminPage 
	public List<Map<String, Object>> selectCodeCount();
	
	//UserMapper로 옮길것 
	public List<BoardDTO> selectUserList();
}
