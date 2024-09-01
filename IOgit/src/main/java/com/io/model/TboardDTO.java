package com.io.model;

import java.sql.Clob;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class TboardDTO {
	private Long tno;
	private String tmptitle;
	private String tmpcontent;
	private Timestamp tmpregdate;
	
	private String uemail;
	private String caid;
	private String code;
	private String uname;
	
	/* tempFile */
	
	private String tuuid;
	private String tuploadpth;
	private String tfilename;
	private String tfiletype;
	
}
