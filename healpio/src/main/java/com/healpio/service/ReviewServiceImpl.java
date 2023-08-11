package com.healpio.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healpio.mapper.ReviewMapper;
import com.healpio.vo.Criteria_review;
import com.healpio.vo.PageDto_review;
import com.healpio.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public int insert(ReviewVO reviewVO) {
		return reviewMapper.insert(reviewVO);
	}

	@Override
	public Map<String, Object> getList(String class_no, Criteria_review criteria) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int reviewCount = reviewMapper.getCount(class_no);
		PageDto_review pageDto = new PageDto_review(criteria, reviewCount);
		
		map.put("reviewList", reviewMapper.getList(class_no, criteria));
		map.put("sortingOption", "latest");
		map.put("reviewCount", reviewCount);
		map.put("pageDto", pageDto);
		map.put("avgScore", reviewMapper.getAvgScore(class_no));
		System.out.println("============ " + map.get("avgScore"));
		return map;		
	}

	@Override
	public Map<String, Object> getListHighest(String class_no, Criteria_review criteria) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int reviewCount = reviewMapper.getCount(class_no);
		PageDto_review pageDto = new PageDto_review(criteria, reviewCount);

		map.put("reviewList", reviewMapper.getListHighest(class_no, criteria));
		map.put("sortingOption", "highest");
		map.put("reviewCount", reviewCount);
		map.put("pageDto", pageDto);
		map.put("avgScore", reviewMapper.getAvgScore(class_no));
		return map;	
	}

	@Override
	public Map<String, Object> getListLowest(String class_no, Criteria_review criteria) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int reviewCount = reviewMapper.getCount(class_no);
		PageDto_review pageDto = new PageDto_review(criteria, reviewCount);

		map.put("reviewList", reviewMapper.getListLowest(class_no, criteria));
		map.put("sortingOption", "lowest");
		map.put("reviewCount", reviewCount);
		map.put("pageDto", pageDto);
		map.put("avgScore", reviewMapper.getAvgScore(class_no));
		return map;	
	}
	
	@Override
	public ReviewVO getOne(String review_no) {
		return reviewMapper.getOne(review_no);
	}
	
	@Override
	public int update(ReviewVO reviewVO) {
		return reviewMapper.update(reviewVO);
	}

	@Override
	public int delete(String review_no) {
		return reviewMapper.delete(review_no);
	}

}
