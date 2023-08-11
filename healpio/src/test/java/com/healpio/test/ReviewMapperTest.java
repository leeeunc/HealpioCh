package com.healpio.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.ReviewMapper;
import com.healpio.vo.Criteria_review;
import com.healpio.vo.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTest {

	@Autowired
	ReviewMapper reviewMapper;
	
//	@Test
//	public void insert() {
//		ReviewVO reviewVO = new ReviewVO();
//		reviewVO.setMember_no("M000002");
//		reviewVO.setClass_no("C000072");
//		reviewVO.setReview_content("선생님 최고입니다.");
//		reviewVO.setReview_star(5);
//		reviewMapper.insert(reviewVO);
//	}
//	
//	@Test
//	public void getList() {
//		Criteria_review criteria = new Criteria_review();
//		reviewMapper.getList("C000029", criteria);
//	}
//	
//	@Test
//	public void getListHighest() {
//		Criteria_review criteria = new Criteria_review();
//		reviewMapper.getListHighest("C000029", criteria);
//	}
//	
//	@Test
//	public void getListLowest() {
//		Criteria_review criteria = new Criteria_review();
//		reviewMapper.getListLowest("C000029", criteria);
//	}
//	
	@Test
	public void getAvgScore() {
		reviewMapper.getAvgScore("C000127");
	}
//	
//	@Test
//	public void getReviewCount() {
//		reviewMapper.getReviewCount("C000072");
//	}
//	
//	@Test
//	public void getOne() {
//		reviewMapper.getOne("r000114");
//	}
//	
//	@Test
//	public void update() {
//		ReviewVO reviewVO = new ReviewVO();
//		reviewVO.setReview_no("r000107");
//		reviewVO.setReview_content("마치 연체동물이 된 것 같아요");
//		reviewVO.setReview_star(5);
//		reviewMapper.update(reviewVO);
//	}
//	
//	@Test
//	public void delete() {
//		reviewMapper.delete("r000005");
//	}

}
