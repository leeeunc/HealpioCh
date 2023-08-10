package com.healpio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value="main.do")
	public String initMain() {
		return "main/main";
	}
	
	@GetMapping("/intro")
	public String intro() {
		return "main/intro";
	}
	
}
