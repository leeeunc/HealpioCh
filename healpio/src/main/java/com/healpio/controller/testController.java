package com.healpio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class testController {
	
	@GetMapping("page")
	public String test() {
		return "/test/test";
	}
	
	// 수정테스트
	@PostMapping("page")
	public String test1() {
		return "/test/test";
	}
	
	// 한글 인코딩 테스트 잘 됩니까?
	// 안깨져서 나오지요?
	// utf-8 설정은 하셨나요?
	// git config --global gui.encoding utf-8
}	
