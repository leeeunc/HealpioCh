package com.healpio.vo;

import lombok.Data;

@Data
public class ClassVO {
	// class_no와 member_no는 String 타입
	private String class_no;
	private int location_no;
	private String member_no;
	private String class_title;
	private String class_content;
	private String class_introduce;
	private String class_regdate;
	private String teacher_content;
	private String class_attach;
	private int class_maxcount;
	private String class_price;
}