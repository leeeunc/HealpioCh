package com.healpio.vo;

import lombok.Data;

@Data
public class MessageVO {

	private String message_no;
	private String message_title;
	private String message_content;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String readYN;
	
	private String member_no;
	
}
