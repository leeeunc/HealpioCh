package com.healpio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.healpio.service.MypageService;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ViewScrapVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class StudentController {
	@Autowired
	MypageService mypageService;
	
	@GetMapping("/scrap/list/{member_no}")
	public Map<String, Object> scrapList(@PathVariable("member_no") String member_no) {
		
		List<ViewScrapVO> list = mypageService.getScrapList(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@GetMapping("/reservation/list/{member_no}")
	public Map<String, Object> reservationList(@PathVariable("member_no") String member_no){
		List<MyReservationVO> reservation_list = mypageService.getReservationList(member_no);
		List<MyReservationVO> history_list = mypageService.getPreviousCourses(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservation_list", reservation_list);
		map.put("history_list", history_list);
		return map;
	}
	
	@GetMapping("/reservation/delete/{reservation_no}")
	public Map<String, Object> reservationDelete(@PathVariable("reservation_no") String reservation_no){
		int res = mypageService.reservationDelete(reservation_no);
		String msg = "";
		if(res > 0) {
			msg = "1건이 삭제되었습니다.";
		}else {
			msg = "삭제 중 오류가 발생하였습니다.";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		
		return map;
	}
	
}
