package com.io.service;

import java.util.List;

import com.io.model.BoardDTO;
import com.io.model.TboardDTO;

public interface BoardService {
	
	public List<BoardDTO> listGetBoard();
	
	public List<TboardDTO> listGetTBoard(TboardDTO dto);

	public void listPutBoard(TboardDTO dto);
	
	public void changeTboard(TboardDTO dto);
	
	public void permitCodeChangeComplete();
}
