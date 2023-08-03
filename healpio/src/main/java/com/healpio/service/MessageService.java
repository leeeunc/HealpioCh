package com.healpio.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MessageVO;


@Service
public interface MessageService {

	public List<MessageVO> getRecvList(Criteria cri, MemberVO member, Model model);

	public List<MessageVO> getSendList(Criteria cri, MemberVO member, Model model);
	
	public int getRecvTotalCnt(MemberVO member);

	public int getSendTotalCnt(MemberVO member);
	
	public int getUnreadCnt(MemberVO member);
	
	public MessageVO getRecvOne(String message_no, Model model);

	public MessageVO getSendOne(String message_no, Model model);
	
	public int send(MessageVO message);
	
	public int reply(MessageVO message);

	public void readCheck(String message_no);

	
}
