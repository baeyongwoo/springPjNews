package com.io.service;

import java.util.List;
import java.util.Map;

import com.io.model.BoardDTO;
import com.io.model.Criteria;
import com.io.model.TboardDTO;

public interface BoardService {
	// 기사상세보기
	public BoardDTO readBoard(long bno);

	public Map<String, List<BoardDTO>> listGetBoard();

	public List<TboardDTO> listGetTBoard(TboardDTO dto);
	
	public List<TboardDTO> listGetTBoardOfPaging(TboardDTO dto, Criteria cri);

	public void listPutBoard(TboardDTO dto);

	public void changeTboard(TboardDTO dto);

	public void permitCodeChangeComplete();

	public List<Map<String, Object>> getsCountOfCode();

	// UserService로 옮길 예정
	public List<BoardDTO> listUserListOfPost();

	public List<BoardDTO> selectCateAll();

	public List<BoardDTO> selectAllBoardOfCaid(BoardDTO dto);
}
