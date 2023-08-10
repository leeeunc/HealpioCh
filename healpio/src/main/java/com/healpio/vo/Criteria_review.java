package com.healpio.vo;

import lombok.Data;

@Data
public class Criteria_review {

	private String criteria = "";
	
	private int amount = 4; // 페이지당 게시물 수	
	private int pageno = 1; // 요청한 페이지 번호
	private int startnum = 1; // 요청한 페이지의 시작 ROWNUM
	private int endnum = 4; // 요청한 페이지의 끝 ROWNUM
	
	public void setPageno(int pageno) {
		if(pageno>0) {
			this.pageno = pageno;
			endnum = pageno*amount;
			startnum = (pageno*amount)-(amount-1);
		} else {
			this.pageno = 1;
		}
	}

}
