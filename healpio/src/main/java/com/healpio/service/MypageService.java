package com.healpio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.healpio.vo.MemberVO;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

@Service
public interface MypageService {
	
	public MemberVO getInfoList(String member_no);
	
	public int myInfoEdit(MemberVO vo);
	
	public List<ViewScrapVO> getScrapList(String member_no);
	
	public List<ViewScrapVO> getRegisterList(String member_no);
	
	public List<MyReservationVO> getReservationList(String member_no);
	
	public int reservationDelete(String reservation_no);
	
	public List<MyReservationVO> getHistory(String member_no);
}
