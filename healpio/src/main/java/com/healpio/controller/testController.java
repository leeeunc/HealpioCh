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
	
	// Require approval of the most recent reviewable push
	// 테스트입니다
	
	// Include administrators
	// 제한이 없어 원본 리포지토리는 검토 이후 push가 아니라 바로 merge가 됩니다
	
	// 새규칙생성
	// feature_administrators Active 2 rules • targeting 3 branches
	
	// Do not allow bypassing the above settings
	// The above settings will apply to administrators and custom roles with the "bypass branch protections" permission.
	// Include administrators → Do not allow bypassing the above settings 로 변경되었습니다
	

}	
