package com.healpio.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {

	private String reservation_no;
	private String member_no;
	private String class_no;
	private String reservation_date;
	private String reservation_time;
	private Date reservation_regdate;
	private int reservation_count = 0;
	private int reservation_maxcount = 0;
	
    public String getMemberNo() {
        return member_no;
    }

    public void setMemberNo(String memberNo) {
        this.member_no = memberNo;
    }

    public String getClassNo() {
        return class_no;
    }

    public void setClassNo(String classNo) {
        this.class_no = classNo;
    }

    // maxcount 관련 getter, setter도 추가...
    public int getReservation_maxcount() {
        return reservation_maxcount;
    }

    public void setReservation_maxcount(int reservation_maxcount) {
        this.reservation_maxcount = reservation_maxcount;
    }
	
}
