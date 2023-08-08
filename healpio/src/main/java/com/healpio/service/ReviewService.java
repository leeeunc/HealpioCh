package com.healpio.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.healpio.vo.Criteria_review;
import com.healpio.vo.ReviewVO;

@Service
public interface ReviewService {

	public int insert(ReviewVO reviewVO);
	public Map<String, Object> getList(String class_no, Criteria_review criteria);
	public Map<String, Object> getListHighest(String class_no, Criteria_review criteria);
	public Map<String, Object> getListLowest(String class_no, Criteria_review criteria);
	public ReviewVO getOne(String review_no);
	public int update(ReviewVO reviewVO);
	public int delete(String review_no);
	
}
