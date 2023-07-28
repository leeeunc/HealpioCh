package com.healpio.vo;

import lombok.Data;

@Data
public class Criteria {

	private String searchField; // 寃��깋議곌굔
	private String searchWord;	// 寃��깋�뼱
	
	private int pageNo = 1;		// �슂泥� �럹�씠吏� 踰덊샇
	private int amount = 10; 	// �븳�럹�씠吏��떦 寃뚯떆臾쇱닔
	
	private int startNo = 1;
	private int endNo = 10;
	
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
	
}










