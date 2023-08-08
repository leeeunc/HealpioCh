package com.healpio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.healpio.vo.Criteria_review;
import com.healpio.vo.ReviewVO;

public interface ReviewMapper {

	public int insert(ReviewVO reviewVO);
	public List<ReviewVO> getList(@Param(value="class_no") String class_no, @Param(value="criteria") Criteria_review criteria);
	public List<ReviewVO> getListHighest(@Param(value="class_no") String class_no, @Param(value="criteria") Criteria_review criteria);
	public List<ReviewVO> getListLowest(@Param(value="class_no") String class_no, @Param(value="criteria") Criteria_review criteria);
	public double getAvgScore(String class_no);
	public int getCount(String class_no);
	public ReviewVO getOne(String review_no);
	public int update(ReviewVO reviewVO);
	public int delete(String review_no);

}
