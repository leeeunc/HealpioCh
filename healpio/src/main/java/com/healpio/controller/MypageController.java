package com.healpio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healpio.service.MypageService;
import com.healpio.vo.MemberVO;
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
		//model.addAttribute("scrapList", scrapList);
		
		
		return "/mypage/myPage_student";
	}
	
	@GetMapping("teacher")
	public String teacher(MemberVO vo, Model model) {
		MemberVO memberVO = mypageService.getInfoList(vo.getMember_no());
		List<ViewScrapVO> scrapList = mypageService.getScrapList(vo.getMember_no());
	
		model.addAttribute("memberVO", memberVO );
		model.addAttribute("member_no", vo.getMember_no());
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
