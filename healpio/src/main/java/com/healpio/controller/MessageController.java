package com.healpio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.healpio.service.MessageService;
import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MessageVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/message/*")
@Log4j
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@PostMapping("list_recv")
	public void getRecvList(Criteria cri, MemberVO member, Model model) {
		messageService.getRecvList(cri, member, model);
		
		log.info("====================list");
		log.info("cri : " + cri);
	
	}
	
	@PostMapping("list_send")
	public void getSendList(Criteria cri, MemberVO member, Model model) {
		messageService.getSendList(cri, member, model);
	}
	
	@GetMapping("view_recv")
	public void getRecvOne(String message_no, Model model) {
		messageService.getRecvOne(message_no, model);
		messageService.readCheck(message_no);
	}
	
	@GetMapping("view_send")
	public void getSendOne(String message_no, Model model) {
		messageService.getSendOne(message_no, model);
	}
	
	@GetMapping("reply")
	public void reply(Model model) {
		
	}
	
	@PostMapping("reply")
	public void replyAction(MessageVO message, Model model) {
		int res = messageService.reply(message);
		
	}
	
	@GetMapping("send")
	public void send(Model model) {
		
	}
	
	@PostMapping("send")
	public void sendAction(MessageVO message, Model model) {
		int res = messageService.send(message);
		
	}
	
	
}