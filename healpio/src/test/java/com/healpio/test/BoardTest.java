package com.healpio.test;

import static org.junit.Assume.assumeNotNull;

import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.BoardMapper;
import com.healpio.vo.BoardScrapVO;
import com.healpio.vo.ClassVO;
import com.healpio.vo.Criteria;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;
import com.healpio.vo.MemberVO;

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
		Criteria cri =  new Criteria();
		 cri.setSearchField("c.class_title"); 
		/*
		 * cri.setExercise_name("필라테스");
		 */		
		 
		List<BoardScrapVO> list = boardMapper.getList(cri);

		
		list.forEach(board ->{
			log.info("BoardScrapVO====================");
			log.info(board.getClass_title());
			log.info(board.getNickname());
			log.info(board.getExercise_name());
			log.info(board.getProvince());
			log.info(board.getCity());
			log.info(board.getDistrict());
			log.info(board.getUuid());
			log.info(board.getTeacheryn());
			log.info(board.getClass_no());
			
		});
		
		
	}
	
	
	  @Test 
	  public void scrapList() {
		  assumeNotNull(boardMapper);
		 
		  int list = boardMapper.scrapList("C000002");
		  		 
		  log.info(list); 
	  }
	 
	
	  @Test 
	  public void exerciseTest() {
		  assumeNotNull(boardMapper);
	  
	  List<ExerciseVO> list = boardMapper.exerciseList(new Criteria());
	  
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
	 
	/*
	 * @Test public void memberCheck() { assumeNotNull(boardMapper);
	 * 
	 * 
	 * List<MemberVO> list = boardMapper.memberCheck("M000002");
	 * 
	 * 
	 * list.forEach(board ->{ log.info("MemberVO====================");
	 * log.info(board.getMember_no()); log.info(board.getMember_id());
	 * log.info(board.getMember_pw()); log.info(board.getMember_name());
	 * log.info(board.getEmail()); log.info(board.getNickname());
	 * log.info(board.getTeacheryn()); log.info(board.getAdminyn());
	 * log.info(board.getPhonenumber());
	 * 
	 * 
	 * }); }
	 */
	  
}
