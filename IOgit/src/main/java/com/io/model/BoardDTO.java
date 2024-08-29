package com.io.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {
	//board
	private Long bno;
	private String title;
	private String bcontent;
	private Date regdate;
	private String uemail;
	private String caid;
	
	/* file */
	private String buuid;
	private String buploadpath;
	private String bfilename;
	private char bfiletype;
}
