package com.healpio.test;

import static org.junit.Assume.assumeNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.BoardMapper;
import com.healpio.vo.ClassVO;
import com.healpio.vo.Criteria;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardTest {

	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void Test() {
		
		assumeNotNull(boardMapper);
		List<ClassVO> list = boardMapper.getList(new Criteria());
		
		list.forEach(board ->{
			log.info("ClassVO====================");
			log.info(board.getClass_no());
			log.info(board.getMember_no());
			log.info(board.getClass_title());
			log.info(board.getClass_content());
			log.info(board.getClass_introduce());
			log.info(board.getClass_regdate());
			log.info(board.getTeacher_content());
			log.info(board.getClass_maxcount());
			log.info(board.getClass_price());
		});
		
		
	}
	
	  @Test 
	  public void exerciseTest() {
		  assumeNotNull(boardMapper);
	  
	  List<ExerciseVO> list = boardMapper.exerciseList();
	  
	  list.forEach(exercise ->{
	  log.info(exercise.getExercise_name());
	  }); 
	  
	  }
	  
	  @Test
	  public void provinceListTest() { assumeNotNull(boardMapper);
	  
	  List<LocationVO> list = boardMapper.provinceList();
	  
	  list.forEach(location ->{ log.info(location.getProvince());
	  
	  });
	  
	  
	  }
	  
	  @Test public void locationListTest() { assumeNotNull(boardMapper);
	  
	  List<LocationVO> list = boardMapper.locationList();
	  
	  list.forEach(location ->{ log.info(location.getLocation_no());
	  log.info(location.getProvince()); log.info(location.getCity());
	  //log.info(location.getDistrict()); log.info(location.getNeighborhood());
	  
	  }); }
	  
	  
	  @Test
	  public void getTotalCntTest() {
		  
			int res = boardMapper.getTotalCnt(new Criteria());
			
			log.info("totalCnt : " + res);
		  
	  }
	 
	  
	  
	  
}
