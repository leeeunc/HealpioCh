package com.healpio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.healpio.service.MemberService;
import com.healpio.service.MessageService;
import com.healpio.vo.MemberVO;

@Controller
public class MemberController{
	
	
	@Autowired
    MemberService memberService;
	
	@Autowired
	MessageService messageService;

	@GetMapping("/login/naver")
	public void naverLogin() {

	}

	@GetMapping("/login/naver_callback")
	public String naverLogin_callback(HttpServletRequest request, Model model) {
		memberService.naverLogin(request, model);

		return "redirect:/";
	}

    @GetMapping("/login/login")
    public String login() {
        return "login/login";
    }
    
 // "signup.jsp" 페이지 요청을 처리하는 메서드를 추가합니다.
    @GetMapping("/login/signtype")
    public String signtypePage() {
        return "login/signtype"; 
    }
    
    @PostMapping("/login/signup")
    public String signupPage() {
        
            return "login/signup";    
    }
    
    @PostMapping("/login/findPw")
    public String findPwPage() {
        
            return "login/findPw";    
    }
    
   
    	@PostMapping("/loginAction")
    	public String loginAction(@RequestParam("id") String member_id,
    	                           @RequestParam("pw") String member_pw,
    	                           Model model,
    	                           HttpSession session) {

    		
        MemberVO memberVo = new MemberVO();
        memberVo.setMember_id(member_id);
        memberVo.setMember_pw(member_pw);

        System.out.println("member_id  : " + member_id);
        System.out.println("member_pw  : " + member_pw);
        // 사용자가 입력한 아이디와 비밀번호를 검증하기 위해 MemberService의 메서드를 호출합니다.
         memberVo = memberService.login(memberVo);
         
        if (memberVo != null) {
           	// 인증 성공: 세션에 사용자 정보를 저장하고 home 페이지로 리다이렉트합니다.
            
            // 로그인 성공
        	    
           session.setAttribute("memberVo", memberVo);
           session.setAttribute("userId", memberVo.getMember_id());
           
           int unreadCnt = messageService.getUnreadCnt(memberVo);
           session.setAttribute("unreadCnt", unreadCnt);
           
            return "redirect:/";
        } else {
            // 로그인 실패
            model.addAttribute("errorMSG", "잘못된 아이디 또는 비밀번호 입니다.");
            return "/login/login";
        }
    }
    	
    	
    
    
	@PostMapping("/idCheck")
	@ResponseBody
	// 넘겨줄때도 JSON 문자열로 반환 할겁니다.
	public  Map<String, Object> idCheck(@RequestBody MemberVO memberVO){
		
		int res = memberService.idCheck(memberVO);
		
		// idCheck 와 같은 경우는 거꾸로 돌아간다
		// count = 1 로그인실패,
		// insert, update, delete > 0  true
		
		// decode(count(*),0,1,0), 0 이면 메세지 나오도록 수정함
		Map<String, Object> response = new HashMap<>();
		
		if(res == 0) {
			response.put("message", "사용 가능한 아이디 입니다.");
			response.put("result", true);
		} else {
			response.put("message", "이미 사용 중인 아이디 입니다.");
			response.put("result", false);
		}
		return response;
	}
	
	@PostMapping("/nickCheck")
	@ResponseBody
	// 넘겨줄때도 JSON 문자열로 반환 할겁니다.
	public  Map<String, Object> nickCheck(@RequestBody MemberVO memberVO){
		
		int res = memberService.nickCheck(memberVO);
		
	
		Map<String, Object> response = new HashMap<>();
		
		if(res == 0) {
			response.put("message", "사용 가능한 닉네임 입니다.");
			response.put("result", true);
		} else {
			response.put("message", "이미 사용 중인 닉네임 입니다.");
			response.put("result", false);
		}
		return response;
	}
	
	@PostMapping("/register")
	@ResponseBody
	public Map<String, Object> register(@RequestBody MemberVO memberVO) {
	    try {
	    	
	    	System.out.println("memberVO : " + memberVO);
	        // 회원가입 서비스 호출
	        int res = memberService.insert(memberVO);
	        if (res > 0) {
	            // 회원가입 성공 시 success 메시지를 반환
	            return responseMapMessage("success", "회원가입이 완료되었습니다.");
	        } else {
	            // 회원가입 실패 시 fail 메시지를 반환
	            return responseMapMessage("fail", "회원가입에 실패하였습니다. 다시 확인하세요.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return responseMapMessage("fail", "등록 중 예외사항이 발생하였습니다.");
	    }
	}

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
	
	
	 @GetMapping("logout.do")
	 public String logoutMainGET(HttpServletRequest request) throws Exception{
	        
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";        
        
	    }
	 
	 @GetMapping("/login/findIdView")
	    public String findIdView() {
	        return "/login/findIdView";
	    }
    
	 @PostMapping("/login/findId")
	    public String findId(@RequestParam("email") String email, Model model) {
	        List<MemberVO> members = memberService.findId(email);
	        model.addAttribute("memberList", members);
	        return "/login/findId";
	    }
	 
	 @PostMapping("/login/findPwAction")
	 @ResponseBody
	 public Map<String, Object> findPwAction(@RequestBody MemberVO memberVo) {
	     // userEmail과 userName을 사용하여 회원 정보를 조회하여 유효성을 검사하고, 회원 정보가 맞으면 이메일로 임시 비밀번호를 전송
	     // 회원 정보가 맞지 않다면 에러 메시지를 반환

	     // 사용자 정보를 확인하는 로직은 데이터베이스에서 이메일과 이름으로 회원 정보를 조회하여 확인합니다.
	     // 이 부분은 MemberService의 메서드를 호출하여 처리하도록 합니다.
	     boolean isUserInfoValid = memberService.checkUser(memberVo.getEmail(), memberVo.getMember_name());
	     
	     if (isUserInfoValid) {
	         // 사용자 정보가 맞으면 이메일로 임시 비밀번호 전송
	         String temporaryPassword = RandomPassword(8); // 8자리 임시 비밀번호 생성
	         memberService.sendTemporaryPasswordByEmail(memberVo.getEmail(), memberVo.getMember_name(),temporaryPassword);
	         System.out.println(memberVo);
		     
	         Map<String, Object> response = new HashMap<>();
	         response.put("check", true);
	         return response;
	     } else {
	         // 사용자 정보가 맞지 않으면 에러 메시지 반환
	         Map<String, Object> response = new HashMap<>();
	         response.put("check", false);
	         return response;
	     }
	 }

	 private String RandomPassword(int length) {
	     String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
	     StringBuilder randomPassword = new StringBuilder(length);
	     ThreadLocalRandom random = ThreadLocalRandom.current();

	     for (int i = 0; i < length; i++) {
	         int randomIndex = random.nextInt(chars.length());
	         randomPassword.append(chars.charAt(randomIndex));
	     }

	     return randomPassword.toString();
	 }

	
	 
}

