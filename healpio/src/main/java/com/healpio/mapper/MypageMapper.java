package com.healpio.mapper;

import java.util.List;

import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

public interface MypageMapper {
	
	public List<ViewScrapVO> getScrapList(String member_no);
	
	public List<MyReservationVO> getReservationList(String member_no);
	
	public int reservationDelete(String reservation_no);
	
	public List<MyReservationVO> getHistory(String member_no);
	
}
