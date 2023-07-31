package com.healpio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.healpio.service.BoardService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Controller
@Log4j
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public void getList(Model model) {
		log.info("�׽�Ʈ!=================================");
		boardService.getList(model);
		boardService.exerciseList(model);
		boardService.provinceList(model);
		boardService.locationList(model);
		log.info("git �׽�Ʈ!=================================");
		// test tset test
	}
}
