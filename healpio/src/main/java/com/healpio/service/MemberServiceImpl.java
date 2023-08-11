package com.healpio.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.healpio.mapper.MemberMapper;
import com.healpio.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public MemberVO login(MemberVO paramMember) {
	    // 사용자 정보 조회
	    MemberVO memberVo = memberMapper.login(paramMember);

	    if (memberVo != null) {
	        // 사용자가 입력한 비밀번호와 데이터베이스에 저장된 비밀번호 비교
	        // 암호화된 비밀번호와 사용자가 입력한 비밀번호를 비교
	    	boolean res = 
					encoder.matches(paramMember.getMember_pw(), memberVo.getMember_pw());	
			         // 비밀번호가 일치하면 로그인 성공
	    	if(res) {
			 return memberVo;
	        }
	    }
	   

	    // 비밀번호가 일치하지 않으면 로그인 실패
	    return null;
	}



	@Override
	public int insert(MemberVO memberVo) {
	    // 비밀번호 암호화
	    memberVo.setMember_pw(encoder.encode(memberVo.getMember_pw()));

	    // 회원 정보를 DB에 저장
	    int res = memberMapper.insert(memberVo);
	    return res > 0 ? 1 : 0; // 1: 회원가입 성공, 0: 회원가입 실패
	}


	
	public void insertMember(MemberVO memberVo) throws Exception {
		memberVo.setTeacheryn("Y");
	    memberMapper.insert(memberVo);
	}
	
	
	@Override
	public int idCheck(MemberVO memberVo) {
		return memberMapper.idCheck(memberVo);
	}
	
	@Override
	public int nickCheck(MemberVO memberVo) {
		return memberMapper.nickCheck(memberVo);
	}

	@Autowired
	ApiExamMemberProfile apiExam;
	@Override
	public void naverLogin(HttpServletRequest request, Model model) {
		try {
			// 컨트롤러로 부터 매개변수 받아옴
			// callback 처리 -> access_token
			Map<String, String> callbackRes = callback(request);
			
			String access_token = callbackRes.get("access_token");
			
			// access_token -> 사용자 정보 조회 (아이디값을 가져와야 등록된 사용자인지 아닌지 판별하기 때문에)
			Map<String, Object> responseBody = apiExam.getMemberProfile(access_token);
			
			Map<String, String> response = (Map<String, String>)responseBody.get("response");
			
			System.out.println("==================naverLogin");
			System.out.println("name : " + response.get("name"));
			System.out.println("email : " + response.get("email"));
			System.out.println("nickname : " + response.get("nickname"));
			System.out.println("mobile : " + response.get("mobile"));
			System.out.println("birthday : " + response.get("birthday"));
			System.out.println("==================naverLogin");
			
			// 세션에 저장 member를
			// 화면에 출력하고싶어서 모델에 저장
			model.addAttribute("name", response.get("name"));
			model.addAttribute("id", response.get("id"));
			model.addAttribute("age", response.get("age"));
			model.addAttribute("gender", response.get("gender"));
			model.addAttribute("email", response.get("email"));
			model.addAttribute("nickname", response.get("nickname"));
			model.addAttribute("mobile", response.get("mobile"));
			model.addAttribute("birthday", response.get("birthday"));
			model.addAttribute("birthyear", response.get("birthyear"));
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
	
	// jsp에서 하는일을 메서드로 호출하려고 하나 만들어놓음
	public Map<String, String> callback(HttpServletRequest request) throws Exception {
		 String clientId = "gBAN0Ls0yFaJzDGPwVOR";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "_UkusFzRPo";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    try {
		    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver_callback", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		      // URL 요청
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      // 결과 받아옴
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      // 결과 받아오고 비교
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      // 엑세스 토큰 얻어오는것
		      if(responseCode==200) {
		    	  // jsp 에서 사용하는 내장객체이기때문에 오류남
//		        out.println(res.toString());
		    	  // 요청결과를 map으로 반환해서
		        System.out.println("ascess_token요청결과" + res.toString());
		        // json문자열을 Map으로 변환
		        Map<String, String> map = new HashMap<String, String>();
		        ObjectMapper objectMapper = new ObjectMapper();
				map = objectMapper.readValue(res.toString(), Map.class);
				return map;
		      } else {
		    	  throw new Exception("callback 반환코드 : " + responseCode);
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		      throw new Exception("callback 처리중 예외사항이 발생 하였습니다.");
		    }
	}



	@Override
	public List<MemberVO> findId(String email) {
		
		return memberMapper.findId(email);
	}



	@Override
    public void sendTemporaryPasswordByEmail(String userEmail, String userName, String temporaryPassword) {
        // 이메일 전송 설정
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(userEmail); // 수신자 이메일 주소
        message.setSubject("임시 비밀번호 발송"); // 이메일 제목
        message.setText("안녕하세요, " + userName 
                + "님!\n입력하신 정보로 임시 비밀번호가 발송되었습니다.\n임시 비밀번호: " + temporaryPassword);

        // 이메일 전송
        mailSender.send(message);
    }
	

	@Override
    public boolean checkUser(MemberVO memberVo) {
        MemberVO member = memberMapper.findPw(memberVo);
        return member != null; // 회원 정보가 존재하면 true, 존재하지 않으면 false를 반환
    }



	@Override
	public int updatePw(MemberVO memberVo) {
		
		memberVo.setMember_pw(encoder.encode(memberVo.getMember_pw()));

		int res = memberMapper.updatePw(memberVo);				
		
		return res;
	}


}