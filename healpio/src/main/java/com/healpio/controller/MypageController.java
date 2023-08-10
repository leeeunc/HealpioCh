package com.healpio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healpio.service.MypageService;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MyReservationVO;
import com.healpio.vo.ScrapVO;
import com.healpio.vo.ViewScrapVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("student")
	public String student(MemberVO vo, Model model) {
		MemberVO memberVO = mypageService.getInfoList(vo.getMember_no());
		List<ViewScrapVO> scrapList = mypageService.getScrapList(vo.getMember_no());
	
		model.addAttribute("memberVO", memberVO );
		model.addAttribute("member_no", vo.getMember_no());
		model.addAttribute("scrapList", scrapList);
		//model.addAttribute("scrapList", scrapList);
		
		
		return "/mypage/myPage_student";
	}
	
	@GetMapping("teacher")
	public String teacher(MemberVO vo, Model model) {
		MemberVO memberVO = mypageService.getInfoList(vo.getMember_no());
		List<ViewScrapVO> registerList = mypageService.getRegisterList(vo.getMember_no());
	
		model.addAttribute("memberVO", memberVO );
		model.addAttribute("member_no", vo.getMember_no());
		model.addAttribute("registerList", registerList);
		//model.addAttribute("scrapList", scrapList);
	
		return "/mypage/myPage_teacher";
	}
	
	
	@PostMapping("edit")
	public String edit(MemberVO vo, RedirectAttributes rttr) {
		int res = mypageService.myInfoEdit(vo);
		log.info("=========================================================" + res);
		if(res > 0) {
			rttr.addAttribute("member_no", vo.getMember_no());
			
			if(vo.getTeacheryn().equals("Y")) {
				
				return "redirect:/mypage/teacher";
			}else {
				return "redirect:/mypage/student";
			}
		}else{
			rttr.addAttribute("msg", "수정 중 에러가 발생하였습니다.");
			return "/";
		}
		
		
	}
	
	@ResponseBody
	@GetMapping("student/reservation/{member_no}")
	public Map<String, Object> studentReservation(@PathVariable("member_no") String member_no) {
		List<MyReservationVO> student_resList = mypageService.getReservationList(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("student_resList", student_resList);
		
		return map;
		
		
	}
	
	@ResponseBody
	@GetMapping("teacher/reservation/{member_no}")
	public Map<String, Object> teacherReservation(@PathVariable("member_no") String member_no) {
		List<MyReservationVO> teacher_resList = mypageService.resCheckList(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teacher_resList", teacher_resList);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("deleteReservation/{reservation_no}")
	public Map<String, Object> deleteReservation(@PathVariable("reservation_no") String reservation_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		int res = mypageService.reservationDelete(reservation_no);
		String msg = "";
		if(res > 0) {
			msg = "예약이 취소되었습니다.";
			
		}else {
			msg = "예약 취소 중 에러가 발생하였습니다. 관리자에게 문의해주세요.";
			
		}
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@GetMapping("student/history/{member_no}")
	public Map<String, Object> gePreviousCourse(@PathVariable("member_no") String member_no) {
		List<MyReservationVO> preCourseList = mypageService.getPreviousCourses(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("preCourseList", preCourseList);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("teacher/history/{member_no}")
	public Map<String, Object> getPreviousBookings(@PathVariable("member_no") String member_no) {
		List<MyReservationVO> preBooksList = mypageService.getPreviousBookings(member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("preBooksList", preBooksList);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("passwordCheck")
	public Map<String,Boolean> getPasswordCheck(@RequestBody MemberVO memberVo){
		Boolean res = mypageService.passwordCheck(memberVo);
		
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		
		map.put("passwordCheck", res);
		
		return map;
 		
	}
	
	
	
	
	@GetMapping("scrap")
	public String scrap() {
		return "/mypage/scrap";
	}
	
	@GetMapping("reservation")
	public String reservation() {
		return "/mypage/reservation";
	}
	
	@GetMapping("history")
	public String history() {
		return "/mypage/history";
	}
	
}
