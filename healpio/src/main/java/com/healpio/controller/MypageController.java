package com.healpio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.healpio.service.MypageService;
import com.healpio.vo.MemberVO;
import com.healpio.vo.ScrapVO;
import com.healpio.vo.ViewScrapVO;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("student")
	public String student(MemberVO vo, Model model) {
		MemberVO memberVO = mypageService.getInfoList(vo.getMember_no());
		List<ViewScrapVO> scrapList = mypageService.getScrapList(vo.getMember_no());
	
		model.addAttribute("memberVO", memberVO );
		//model.addAttribute("scrapList", scrapList);
		
		
		return "/mypage/myPage_student";
	}
	
	@GetMapping("teacher")
	public String teacher() {
		return "/mypage/myPage_teacher";
	}
	
	
//	@PostMapping("edit")
//	public String edit(MemberVO vo, Model model) {
//		
//	}
	
	
	
	
	
	
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
