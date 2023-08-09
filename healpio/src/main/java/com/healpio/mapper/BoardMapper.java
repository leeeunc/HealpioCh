package com.healpio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.healpio.vo.BoardScrapVO;
import com.healpio.vo.Criteria;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;


public interface BoardMapper {


	public List<BoardScrapVO> getList(Criteria cri);
	
	/*
	 * public List<BoardScrapVO> scrapList(Criteria cri);
	 */
	public List<ExerciseVO> exerciseList(Criteria cri);
	
	public List<LocationVO> provinceList();

	public List<LocationVO> locationList();
	
	public int getTotalCnt(Criteria cri);
	
	
	
}
