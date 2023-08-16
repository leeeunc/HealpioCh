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
import com.healpio.vo.MyReservationVO;
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
		List<ViewScrapVO> scrapVO = mapper.getScrapList("M000004");
		log.info(scrapVO);
	}
	
	@Test
	public void myInfoEdit() {
		MemberVO vo = new MemberVO();
		vo.setMember_no("M000002");
		vo.setMember_pw("1234");
		vo.setNickname("kim min jae");
		vo.setEmail("rrr@naver.com");
		vo.setPhonenumber("010-1111-1111");
		
		int res = mapper.myInfoEdit(vo);
		log.info(res);
	}
	
	@Test
	public void getRegisterList() {
		List<ViewScrapVO> scrapVO = mapper.getRegisterList("M000007");
		log.info(scrapVO);
	}
	
	@Test
	public void getResList() {
		List<MyReservationVO> list = mapper.getReservationList("M000004");
		log.info(list);
	}
	
	@Test
	public void ResCheckList() {
		List<MyReservationVO> list = mapper.resCheckList("M000003");
		log.info(list);
	}
	
	@Test
	public void history() {
		List<MyReservationVO> list = mapper.getPreviousCourses("M000004");
		log.info(list);
	}
	
	@Test
	public void getPassword() {
		MemberVO vo = new MemberVO();
		vo.setMember_no("M000004");
		String password = mapper.getPassword(vo.getMember_no());
		log.info(password);
	}
	
	@Test
	public void myPasswordEdit() {
		MemberVO vo = new MemberVO();
		vo.setMember_no("M000002");
		vo.setMember_pw("12345");
		int res = service.myPasswordEdit(vo);
		log.info(res);
	}
	
	
	
}
