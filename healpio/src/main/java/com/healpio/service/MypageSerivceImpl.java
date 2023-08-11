package com.healpio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.healpio.mapper.MypageMapper;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

@Service
public class MypageSerivceImpl implements MypageService{
	
	@Autowired
	MypageMapper mypageMapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public List<ViewScrapVO> getScrapList(String member_no) {
		// TODO Auto-generated method stub
		List<ViewScrapVO> scrapList = mypageMapper.getScrapList(member_no);
		
		return scrapList;
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
	public List<MyReservationVO> getPreviousCourses(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getPreviousCourses(member_no);
	}

	@Override
	public MemberVO getInfoList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getInfoList(member_no);
	}

	@Override
	public int myInfoEdit(MemberVO vo) {
		vo.setMember_pw(encoder.encode(vo.getMember_pw()));
		return mypageMapper.myInfoEdit(vo);
	}

	@Override
	public List<ViewScrapVO> getRegisterList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getRegisterList(member_no);
	}

	@Override
	public List<MyReservationVO> resCheckList(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.resCheckList(member_no);
	}

	@Override
	public List<MyReservationVO> getPreviousBookings(String member_no) {
		// TODO Auto-generated method stub
		return mypageMapper.getPreviousBookings(member_no);
	}

	@Override
	public Boolean passwordCheck(MemberVO vo) {
		String password = mypageMapper.getPassword(vo.getMember_no());
		Boolean res = encoder.matches(vo.getMember_pw(), password);
		
		
		return res;
		
		
		
	}

}
