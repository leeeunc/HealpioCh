package com.healpio.vo;

import lombok.Data;

@Data
public class ClassVO {
	// class_no와 member_no는 String 타입
	private String class_no;
	private String member_no;
	private String exercise_no;	
	private String class_title;
	private String class_content;
	private String class_introduce;
	private String class_regdate;
	private String teacher_content;
	private int class_maxcount;
	private String class_price;
	
	// 추가
	private String class_day;
	private String class_time;
	
	// 추가
	private String nickname;
	private String exercise_name;
	
	// 추가
	private String province;
	private String city;
	private String district;
	
}