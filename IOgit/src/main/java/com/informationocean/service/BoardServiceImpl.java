package com.informationocean.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.informationocean.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper bm;
	
	@Override
	public String testCheck() {
		return bm.test();
	}

	

}
