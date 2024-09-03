package com.io.service;

import com.io.model.TboardDTO;

public interface TboardService {
	public void changeCode(TboardDTO dto);

	// 기사 작성
	int postTboard(TboardDTO board);

	// 게시글 수정 (제목과 내용만 업데이트)
	void updateTboard(TboardDTO tboard);

	// 게시글 삭제
	void deleteTboard(Long tno);

	// 게시글 상태를 'ready'로 변경
	void updateTboardToReady(Long tno);

	// 특정 게시글 조회
	TboardDTO getTboard(Long tno);
}
