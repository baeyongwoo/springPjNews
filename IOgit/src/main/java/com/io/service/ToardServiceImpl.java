package com.io.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.io.mapper.BoardMapper;
import com.io.mapper.TboardMapper;
import com.io.model.BoardDTO;
import com.io.model.TboardDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ToardServiceImpl implements TboardService{
	
	TboardMapper tm;
	@Override
	public void changeCode(TboardDTO dto) {
		tm.updateCode(dto);
		
		if(dto.getCode().equals("reject")) {
			
		}
		
	}
	@Override
	public int postTboard(TboardDTO board) {
		log.info("등록: " + board);
		return tm.postTboard(board);
	}


    @Override
    public void updateTboard(TboardDTO tboardDTO) {
        tm.editTboard(tboardDTO); // Mapper의 editTboard 메서드 호출
    }

    @Override
    public void deleteTboard(Long tno) {
        tm.deleteTboard(tno);
    }

    @Override
    public void updateTboardToReady(Long tno) {
        // Ensure this method exists in your TboardMapper if used
        tm.updateTboardToReady(tno);
    }

    @Override
    public TboardDTO getTboard(Long tno) {
        return tm.selectTboardById(tno);
    }
	

	}

	

