package com.io.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyVO {
	private Long rno; //댓글번호
	private String rname; //댓글 작성자
	private String rpwd; //댓글 비밀번호
	private String rcon; //댓글 내용
	private Long bno; //board 번호
}
