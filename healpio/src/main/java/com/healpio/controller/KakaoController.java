package com.healpio.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KakaoController {

    //@Value("${kakao.client-id}")
    private String kakaoClientId = "d62ab48f876ef850c35965d93e291a4f";

    //@Value("${kakao.redirect-uri}")
    private String kakaoRedirectUri = "http://localhost:8080/login/kakao";

    @GetMapping("/login/kakao")
    public String kakaoLogin(HttpServletRequest request, Model model) {
    	System.out.println("kakaoClientId : " + kakaoClientId);
    	System.out.println("kakaoRedirectUri : " + kakaoRedirectUri);
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        System.out.println("code : " + code);
        System.out.println("state : " + state);

        // 카카오에서 제공하는 사용자 정보를 받아오기 위해 API 호출
        String userInfoJson = getKakaoUserInfo(code, kakaoRedirectUri);

        // 받아온 JSON 문자열을 Map으로 변환하여 사용자 정보를 추출
        Map<String, String> userInfoMap = new HashMap<>();
		try {
			userInfoMap = convertJsonToMap(userInfoJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
        model.addAttribute("userInfo", userInfoMap);

        return "redirect:/"; // 카카오 로그인 결과를 출력하는 페이지로 이동
    }

    private String getKakaoUserInfo(String code, String redirectUri) {
        try {
            // 카카오 로그인 API를 호출하여 사용자 정보를 받아오는 코드를 작성합니다.
            String apiUrl = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&";
            apiUrl += "client_id=" + kakaoClientId;
            apiUrl += "&redirect_uri=" + redirectUri;
            apiUrl += "&code=" + code;

            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            int responseCode = con.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                ObjectMapper objectMapper = new ObjectMapper();
                Map<String, Object> responseMap = objectMapper.readValue(con.getInputStream(), Map.class);
                String accessToken = (String) responseMap.get("access_token");

                // 액세스 토큰을 사용하여 사용자 정보 조회
                apiUrl = "https://kapi.kakao.com/v2/user/me";
                String authHeader = "Bearer " + accessToken;
                con = (HttpURLConnection) new URL(apiUrl).openConnection();
                con.setRequestProperty("Authorization", authHeader);
                responseCode = con.getResponseCode();

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    return readBody(con.getInputStream());
                }
            }

            return "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private String readBody(java.io.InputStream body) throws IOException {
        java.io.InputStreamReader streamReader = new java.io.InputStreamReader(body);
        try (java.io.BufferedReader lineReader = new java.io.BufferedReader(streamReader)) {
            java.lang.StringBuilder responseBody = new java.lang.StringBuilder();
            java.lang.String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            return responseBody.toString();
        }
    }

    private Map<String, String> convertJsonToMap(String json) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(json, Map.class);
    }
}
