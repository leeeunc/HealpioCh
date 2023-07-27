package com.healpio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class testController {
	
	@GetMapping("page")
	public String test() {
		return "/test/test";
	}
}	
