package com.healpio.mapper;

import java.util.List;

import com.healpio.vo.MemberVO;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

public interface MypageMapper {
	
	// 내정보
	public MemberVO getInfoList(String member_no);
	
	public int myInfoEdit(MemberVO vo);
	
	// 내가 찜한 강의(student)
	public List<ViewScrapVO> getScrapList(String member_no);
	
	
	// 내가 등록한 강의(teacher)
	public List<ViewScrapVO> getRegisterList(String member_no);
	
	// 예약확인(student, teacher)
	public List<MyReservationVO> getReservationList(String member_no); 
	public List<MyReservationVO> resCheckList(String member_no);
	
	
	public int reservationDelete(String reservation_no);
	
	public List<MyReservationVO> getPreviousCourses(String member_no);
	
	public List<MyReservationVO> getPreviousBookings(String member_no);
	
	// 비밀번호 확인
	public String getPassword(String member_no);
	
}
