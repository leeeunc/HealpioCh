package com.healpio.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.MessageMapper;
import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MessageVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MessageTest {

	@Autowired
	MessageMapper messageMapper;
	
	@Test
	public void getRecvList() {
		MemberVO member = new MemberVO();
		Criteria cri = new Criteria();
	
		member.setNickname("kim");
		
		List<MessageVO> list = messageMapper.getRecvList(cri, member);
		
		list.forEach(message -> {
			log.info("=== MessageVO ===");
			log.info(message.getMessage_no());
			log.info(message.getMessage_content());
			log.info(message.getSend_time());
		});
		
	}
	
	@Test
	public void getRecvTotalCnt() {
		MemberVO member = new MemberVO();
		
		member.setNickname("kim");
		
		int res = messageMapper.getRecvTotalCnt(member);
		
		log.info("===========" + res);
		
	}
	
	
	@Test
	public void getRecvOne() {
		MessageVO message = messageMapper.getRecvOne("MSG000022");
		log.info(message);
	}
	
	@Test
	public void send() {
		
		MessageVO message = new MessageVO();
		message.setMessage_title("xml 테스트");
		message.setMessage_content("xml 테스트");
		message.setSend_nick("kim");
		message.setRecv_nick("lee");
		
		int res = messageMapper.send(message);
		
		assertEquals(res, 1);
		
	}
	
	@Test
	public void reply() {
		
		MessageVO message = new MessageVO();
		message.setMessage_title("xml 테스트2");
		message.setMessage_content("xml 테스트2");
		message.setSend_nick("kim");
		message.setRecv_nick("lee");
		
		int res = messageMapper.reply(message);
		
		assertEquals(res, 1);
		
	}
}
