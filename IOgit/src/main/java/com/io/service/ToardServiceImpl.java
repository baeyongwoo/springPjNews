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
	}

	

	}

	

