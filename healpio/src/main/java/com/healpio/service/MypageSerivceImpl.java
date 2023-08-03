package com.healpio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healpio.mapper.MypageMapper;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

@Service
public class MypageSerivceImpl implements MypageService{
	
	@Autowired
	MypageMapper mypageMapper;
	
	@Override
	public List<ViewScrapVO> getScrapList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getScrapList(member_no);
	}

	@Override
	public List<MyReservationVO> getReservationList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getReservationList(member_no);
	}

	@Override
	public int reservationDelete(String reservation_no) {
		// TODO Auto-generated method stub
		return mypageMapper.reservationDelete(reservation_no);
	}

	@Override
	public List<MyReservationVO> getHistory(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getHistory(member_no);
	}

	@Override
	public MemberVO getInfoList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getInfoList(member_no);
	}

}
