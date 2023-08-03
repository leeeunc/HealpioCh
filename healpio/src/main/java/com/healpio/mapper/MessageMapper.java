package com.healpio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.healpio.vo.Criteria;
import com.healpio.vo.MemberVO;
import com.healpio.vo.MessageVO;

public interface MessageMapper {
	
	public List<MessageVO> getRecvList(@Param("cri") Criteria cri, @Param("memberVo") MemberVO member);
	
	public List<MessageVO> getSendList(@Param("cri") Criteria cri, @Param("memberVo") MemberVO member);
	
	public int getRecvTotalCnt(MemberVO member);
	
	public int getSendTotalCnt(MemberVO member);
	
	public int getUnreadCnt(MemberVO member);
	
	public MessageVO getRecvOne(String message_no);
	
	public MessageVO getSendOne(String message_no);
	
	public int send(MessageVO message);
	
	public int reply(MessageVO message);
	
	public void readCheck(String message_no);
}