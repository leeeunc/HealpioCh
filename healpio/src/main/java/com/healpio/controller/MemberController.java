package com.healpio.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.healpio.service.MemberService;
import com.healpio.vo.MemberVO;

@Controller
public class MemberController{
	
	
	@Autowired
    MemberService memberService;

	/**
	 *  home.jsp는 로그인 후 다음페이지로 넘어가는 테스트용 입니다.
	 * @return
	 */
    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    
    
    	@PostMapping("/loginAction")
    	public String loginAction(@RequestParam("id") String member_id,
    	                           @RequestParam("pw") String member_pw,
    	                           Model model,
    	                           HttpSession session) {

        MemberVO memberVo = new MemberVO();
        memberVo.setMember_id(member_id);
        memberVo.setMember_pw(member_pw);

        // 사용자가 입력한 아이디와 비밀번호를 검증하기 위해 MemberService의 메서드를 호출합니다.
         memberVo = memberService.login(memberVo);
         
        if (memberVo != null) {
           	// 인증 성공: 세션에 사용자 정보를 저장하고 home 페이지로 리다이렉트합니다.
            
            // 로그인 성공
        	    
           session.setAttribute("memberVo", memberVo);
           session.setAttribute("userId", memberVo.getMember_id());
            return "redirect:/home";
        } else {
            // 로그인 실패
            model.addAttribute("errorMSG", "잘못된 아이디 또는 비밀번호 입니다.");
            return "login";
        }
    }
    
    /*
	@PostMapping("/idCheck")
	// 넘겨줄때도 JSON 문자열로 반환 할겁니다.
	public @ResponseBody Map<String, Object> idCheck(@RequestBody MemberVO memberVO){
		
		int res = memberService.idCheck(memberVO);
		
		// idCheck 와 같은 경우는 거꾸로 돌아간다
		// count = 1 로그인실패,
		// insert, update, delete > 0  true
		
		// decode(count(*),0,1,0), 0 이면 메세지 나오도록 수정함
		if(res == 0) {
			return responseMapMessage( REST_SUCCESS , "사용가능한 아이디 입니다.");
		} else {
			return responseMapMessage( REST_FAIL , "이미 사용중인 아이디 입니다.");
		}
		
	}
	
	
	@PostMapping("/register")
	public @ResponseBody Map<String, Object> register(@RequestBody MemberVO memberVO){
		
		try {
			int res = memberService.signUp(memberVO);
			return responseWriteMap(res);
		} catch (Exception e) {
			e.printStackTrace();
			return responseMapMessage(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
		}
	}
	*/
    
}















