package com.io.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.io.model.TboardDTO;
import com.io.service.BoardService;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
@Configuration
@EnableScheduling
public class PermitBoardInsertTask {

	@Autowired
	BoardService bs;
	
	
	//정해진 시간에 boardtable에 올리는 스케줄링
	@Scheduled(cron = "00 30 * * * *")
	public void permitCheckInsert() {
		log.info("스케줄실행");
		TboardDTO dto = new TboardDTO();
		dto.setCode("permit");
		try {
			bs.listPutBoard(dto);
			
			
		} catch (Exception e) {
			log.info("스케줄할 대상이 없음");
		}
	}
	
	//나중에 새볔시간에 변경하도록 위 스케줄링 보다 늦어야함
	@Scheduled(cron = "00 59 * * * *")
	public void permitCodeToComplete() {
		log.info("완료로 스케줄링");
		try {
			bs.permitCodeChangeComplete();
			
		} catch (Exception e) {
			log.info("스케줄대상없음");
		}
	}
}
