package com.healpio.vo;

import lombok.Data;

@Data
public class ReservationVO {

	private int reservation_no;
	private int member_no;
	private int class_no;
	private String reservation_date;
	private String reservation_time;
	private String reservation_regdate;
	
}
