package com.io.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.io.mapper.BoardMapper;
import com.io.model.BoardDTO;
import com.io.model.Criteria;
import com.io.model.TboardDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*이 컨트롤러는 실제 유저한테 보여주는 컨트롤러입니다*/

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper bm;
	

	@Override
	public Map<String, List<BoardDTO>> listGetBoard() {
	    Map<String, List<BoardDTO>> list = new HashMap<>();
	    List<BoardDTO> categories = bm.selectCateAll();
	    
	    // 맨 처음 인덱스를 caid가 null인 상태로 추가
	    BoardDTO nullCaidDto = new BoardDTO();
	    nullCaidDto.setCaid(null);
	    List<BoardDTO> nullCaidBoardList = bm.selectAllBoard(nullCaidDto);
	    list.put("최신순", nullCaidBoardList);
	    
	    for (BoardDTO category : categories) {
	        BoardDTO dto = new BoardDTO();
	        dto.setCaid(category.getCaid());
	        List<BoardDTO> boardList = bm.selectAllBoard(dto);
	        list.put(String.valueOf(category.getCategory()), boardList);
	    }
	    
	    return list;
	}


	
	@Override
	public List<TboardDTO> listGetTBoard(TboardDTO dto) {
		//dto안에 있는 code가 null일 경우 전체 보여주고 null이 아닐경우 code값에 따라서 보여주는 쿼리
		return bm.selectAllTempBoard(dto);
	}
	
	@Override
	public List<TboardDTO> listGetTBoardOfPaging(TboardDTO dto, Criteria cri) {
		   // 페이징 처리를 위한 로직 추가
	    int offset = (cri.getPageNum() - 1) * cri.getAmount() + 1;
	    cri.setOffset(offset); // offset 값을 Criteria 객체에 설정
	    return bm.selectAllTempBoardOfPaging(dto, cri);
	}



	@Transactional
	@Override
	public void listPutBoard(TboardDTO dto) {
		List<TboardDTO> tdtoList =  listGetTBoard(dto);
		log.info("list"  + tdtoList);
		bm.insertBoards(tdtoList);
	}

	@Override
	public void changeTboard(TboardDTO dto) {
		bm.updateBoardCode(dto);
		
	}

	@Override
	public void permitCodeChangeComplete() {
		bm.updatePermitToComplete();
		
	}

	@Override
	public List<Map<String, Object>> getsCountOfCode() {
		return bm.selectCodeCount();
	}

	@Override
	public List<BoardDTO> listUserListOfPost() {
		return bm.selectUserList();
		
	}



	@Override
	public List<BoardDTO> selectCateAll() {
		return bm.selectCateAll();
	}



	@Override
	public List<BoardDTO> selectAllBoardOfCaid(BoardDTO dto) {
		return bm.selectAllBoardOfCaid(dto);
	}


	@Override
    public BoardDTO readBoard(long bno) {
        // BoardMapper를 통해 게시글 상세 정보를 조회
        return bm.readBoard(bno);
    }



	
	
	

}
