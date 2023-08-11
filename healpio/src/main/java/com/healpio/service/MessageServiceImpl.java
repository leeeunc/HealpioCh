package com.healpio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MessageVO;
import com.healpio.vo.PageDto;
import com.healpio.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	
	@Override
	public List<MessageVO> getRecvList(Criteria cri, MemberVO member, Model model) {

		List<MessageVO> list = messageMapper.getRecvList(cri, member);
		
		int totalCnt = messageMapper.getRecvTotalCnt(member);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println("=================================");
		System.out.println(member);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		
		
		return null;
	}

	@Override
	public List<MessageVO> getSendList(Criteria cri, MemberVO member, Model model) {
		List<MessageVO> list = messageMapper.getSendList(cri, member);
		
		int totalCnt = messageMapper.getSendTotalCnt(member);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println("=================================");
		System.out.println(member);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		
		return null;
	}

	@Override
	public int getRecvTotalCnt(MemberVO member) {
		return messageMapper.getRecvTotalCnt(member);
	}

	@Override
	public int getSendTotalCnt(MemberVO member) {
		return messageMapper.getSendTotalCnt(member);
	}

	@Override
	public int getUnreadCnt(MemberVO member) {
		return messageMapper.getUnreadCnt(member);
	}

	@Override
	public MessageVO getRecvOne(String message_no, MemberVO member, Model model) {
		MessageVO message = messageMapper.getRecvOne(message_no);
		
		model.addAttribute("msg", message);

		messageMapper.readCheck(message_no);
		
		int newUnreadCnt = messageMapper.getUnreadCnt(member);
		model.addAttribute("newUnreadCnt", newUnreadCnt);
		
		return messageMapper.getRecvOne(message_no);
	}

	@Override
	public MessageVO getSendOne(String message_no, Model model) {
		MessageVO message = messageMapper.getSendOne(message_no);
		
		model.addAttribute("msg", message);
		return messageMapper.getSendOne(message_no);
	}

	@Override
	public int send(MessageVO message) {
		return messageMapper.send(message);
	}

	@Override
	public int reply(MessageVO message) {
		return messageMapper.reply(message);
	}

	@Override
	public void readCheck(String message_no) {
		messageMapper.readCheck(message_no);
	}

}
