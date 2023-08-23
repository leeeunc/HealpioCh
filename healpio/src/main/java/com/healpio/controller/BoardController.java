package com.healpio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.healpio.service.BoardService;
import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Controller
@Log4j
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public void getList(Criteria cri, Model model, String class_no) {
		
		System.out.println(cri);
		boardService.getList(cri, model);
		boardService.exerciseList(cri, model);
		boardService.provinceList(model);
		boardService.locationList(model);
		boardService.attach(model);
		// 8/23 테스트
	}
	
	
}
