package com.healpio.vo;

import lombok.Data;

@Data
public class ReviewVO {

	private int review_no;
	private int member_no;
	private int class_no;
	private String review_regdate;
	private String review_content;
	private double review_star;
	
}
