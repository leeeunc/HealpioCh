package com.healpio.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.healpio.service.ClassService;
import com.healpio.service.ReviewService;
import com.healpio.vo.Criteria_review;
import com.healpio.vo.ReviewVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ClassService classService;
	
	@GetMapping("write")
	public void write(){
		
	}

	@GetMapping("writeAction")
	public String insert(ReviewVO reviewVO, Model model) {
		if(reviewService.insert(reviewVO)>0) {
			model.addAttribute("review_no", reviewVO.getReview_no());
			model.addAttribute("class_no", reviewVO.getClass_no());			
			model.addAttribute("message", "등록되었습니다.");
			return "/class/message";
		} else {
			model.addAttribute("message", "등록 중 오류가 발생하였습니다.");
			return "/class/message";
		}
	}
	
	@GetMapping("list")
	@ResponseBody
	public Map<String, Object> getList(String class_no, Model model) {
		Criteria_review criteria = new Criteria_review();
		return reviewService.getList(class_no, criteria);
	}
	
	@GetMapping("sort")
	@ResponseBody
	public Map<String, Object> sortReview(String option, int page, String class_no, Model model) {
		Criteria_review criteria = new Criteria_review();
		criteria.setPageno(page);
		if("highest".equals(option)){
			return reviewService.getListHighest(class_no, criteria);
		} else if("lowest".equals(option)) {
			return reviewService.getListLowest(class_no, criteria);
		} else {			
			return reviewService.getList(class_no, criteria);
		}
	}
	
	@GetMapping("edit")
	public void edit(String review_no, Model model) {
		model.addAttribute("reviewVO", reviewService.getOne(review_no));
	}
	
	@GetMapping("editAction")
	public String update(ReviewVO reviewVO, Model model) {
		if(reviewService.update(reviewVO)>0) {
			model.addAttribute("class_no", reviewVO.getClass_no());			
			model.addAttribute("message", "수정하였습니다.");
			return "/class/message";
		} else {
			model.addAttribute("message", "수정 중 오류가 발생하였습니다.");
			return "/class/message";
		}
	}
	
	@GetMapping("delete")
	public String delete(String review_no, Model model) {
		ReviewVO reviewVO = reviewService.getOne(review_no);
		if(reviewService.delete(review_no)>0) {
			model.addAttribute("class_no", reviewVO.getClass_no());			
			model.addAttribute("message", "삭제되었습니다.");
			return "/class/message";
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			return "/class/message";
		}
	}
	
}
