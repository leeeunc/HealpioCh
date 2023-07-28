
  package com.healpio.service;
  
  import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.healpio.mapper.BoardMapper;
import com.healpio.vo.ClassVO;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;

  

  @Service 
  public class BoardSerivceImpl implements BoardService{

	  
	 @Autowired
	 private BoardMapper boardMapper;
	  
	 @Override
	 public List<ClassVO> getList(Model model){
		 
		  List<ClassVO> list = boardMapper.getList();
		  model.addAttribute("list", list);
		  
		  return null;
	  }
	 
	 @Override
	 public List<ExerciseVO> exerciseList(Model model){
		 List<ExerciseVO> list = boardMapper.exerciseList();
		 
		 model.addAttribute("exerciseList", list);

		 //			int totalCnt = boardMapper.getTotalCnt(cri);
//			PageDto pageDto = new PageDto(cri, totalCnt);
//			
//			model.addAttribute("list", list);
//			model.addAttribute("totalCnt", totalCnt);
//			model.addAttribute("pageDto", pageDto);
//		 
		 
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
	 
  }
 