package com.healpio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("student")
	public String student() {
		return "/mypage/myPage_student";
	}
	
	@GetMapping("teacher")
	public String teacher() {
		return "/mypage/myPage_teacher";
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
