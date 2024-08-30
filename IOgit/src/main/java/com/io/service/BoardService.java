package com.io.service;

import java.util.List;
import java.util.Map;

import com.io.model.BoardDTO;
import com.io.model.TboardDTO;

public interface BoardService {
	
	public List<BoardDTO> listGetBoard();
	
	public List<TboardDTO> listGetTBoard(TboardDTO dto);

	public void listPutBoard(TboardDTO dto);
	
	public void changeTboard(TboardDTO dto);
	
	public void permitCodeChangeComplete();
	
	public List<Map<String, Object>> getsCountOfCode();
	
	
	//UserService로 옮길 예정
	public List<BoardDTO> listUserListOfPost();
}
