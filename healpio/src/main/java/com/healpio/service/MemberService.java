package com.healpio.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.healpio.vo.MemberVO;

@Service
public interface MemberService {
	
public MemberVO login(MemberVO memberVo);
	
	public int insert (MemberVO memberVo);
	
	public int idCheck (MemberVO memberVo);
	
	public int nickCheck(MemberVO memberVO);
	
	public void naverLogin(HttpServletRequest request, Model model);

	
	
}
