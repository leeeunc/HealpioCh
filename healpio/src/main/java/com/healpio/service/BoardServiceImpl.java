
  package com.healpio.service;
  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.healpio.mapper.BoardMapper;
import com.healpio.vo.ClassVO;
import com.healpio.vo.Criteria;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;
import com.healpio.vo.PageDto;

  

  @Service 
  public class BoardServiceImpl implements BoardService{

	  
	 @Autowired
	 private BoardMapper boardMapper;
	  
	 @Override
	 public List<ClassVO> getList(Criteria cri, Model model){
		 
		  List<ClassVO> list = boardMapper.getList(cri);
		  int totalCnt = boardMapper.getTotalCnt(cri);
		  PageDto pageDto = new PageDto(cri, totalCnt); 
		  
		  model.addAttribute("list", list);
		  model.addAttribute("totalCnt", totalCnt);
		  model.addAttribute("pageDto", pageDto);
		  
		  
		  return null;
	  }
	 
	 
	 
	 @Override
	 public List<ExerciseVO> exerciseList(Model model){
		 List<ExerciseVO> list = boardMapper.exerciseList();
		 
		 model.addAttribute("exerciseList", list);
 
		 
		 return null;
	 }
	 
	 
	 @Override
	 public List<LocationVO> provinceList(Model model){
		 List<LocationVO> list = boardMapper.provinceList();
		 
		 model.addAttribute("provinceList", list);
		 
		 return null;
	 }
	 
	 @Override
	 public List<LocationVO> locationList(Model model){
		 List<LocationVO> list = boardMapper.provinceList();
		 
		 model.addAttribute("locationList", list);
		 
		 return null;
	 }
	 
	 @Override
	 public int getTotalCnt(Criteria cri) {
		 return boardMapper.getTotalCnt(cri);
	 }
	 
  }
 