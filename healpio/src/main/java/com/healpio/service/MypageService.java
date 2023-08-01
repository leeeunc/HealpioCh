package com.healpio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

@Service
public interface MypageService {
	
	public List<ViewScrapVO> getScrapList(String member_no);
	
	public List<MyReservationVO> getReservationList(String member_no);
	
	public int reservationDelete(String reservation_no);
	
	public List<MyReservationVO> getHistory(String member_no);
}
