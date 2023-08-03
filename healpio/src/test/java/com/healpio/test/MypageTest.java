package com.healpio.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.MypageMapper;
import com.healpio.service.MypageService;
import com.healpio.vo.MemberVO;
import com.healpio.vo.ViewScrapVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageTest {
	@Autowired
	MypageMapper mapper;
	
	@Autowired
	MypageService service;
	
	@Test
	public void getInfoList() {
		MemberVO vo = mapper.getInfoList("member1");
		log.info(vo);
	}
	
	@Test
	public void getServiceInfo() {
		MemberVO vo = service.getInfoList("member1");
		log.info(vo);
	}
	
	@Test
	public void getScrapList() {
		List<ViewScrapVO> scrapVO = mapper.getScrapList("M000002");
		log.info(scrapVO);
	}
	
	
	
}
