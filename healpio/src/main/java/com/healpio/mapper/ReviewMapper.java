package com.healpio.mapper;

import java.util.List;

import com.healpio.vo.ReviewVO;

public interface ReviewMapper {

	public int insert(ReviewVO reviewVO);
	public List<ReviewVO> getList(String class_no);
	public double getAvgScore(String class_no);
	public int getCount(String class_no);
	public ReviewVO getOne(String review_no);
	public int update(ReviewVO reviewVO);
	public int delete(String review_no);

}
