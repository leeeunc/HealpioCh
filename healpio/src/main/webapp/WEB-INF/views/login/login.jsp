<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    	<link rel='stylesheet' href='../resources/css/login.css'>
	
</head>
<body>
<!-- test -->
<%@ include file="../common/header.jsp" %>

    <div id="login_container">
        <div id="msg"></div>
        <h1>로그인</h1>
        <form id="login_form" action="/loginAction" method="post">
            <fieldset>
                <legend>로그인</legend>
                <div class="line id">
                    <label for="id" class="sound">아이디</label>
                    <input type="text" id="id" name="id" class="input_txt" placeholder="아이디" value="member1" />
                </div>
                <div class="line pw">
                    <label for="pw" class="sound">비밀번호</label>
                    <input type="password" id="pw" name="pw" class="input_txt" placeholder="비밀번호" value="password" />
                </div>
                <button type="submit" class="login_btn">로그인</button> 
            </fieldset>
        </form>

        <ul id="login_find">
            <li><a href="/login/findIdView" class="find_btn find">아이디/비밀번호 찾기</a></li>
            <li><a href="/login/signtype" class="find_btn join">회원가입</a></li>
        </ul>


    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

  <%
    String clientId = "gBAN0Ls0yFaJzDGPwVOR";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver_callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    
    // 요청URL -> 네이버로그인 및 사용자정보제공 동의 -> 콜백으로 코드를 제공
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  	<ul id="login_sns">
            <li><a href="<%=apiURL%>" class="sns_btn naver">
            <img src='../resources/images/button/btnG_완성형.png' 
            style="display: block; margin: 0 auto; width:300px; height:60px;"></a></li>
            <li>
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=d62ab48f876ef850c35965d93e291a4f&redirect_uri=http://localhost:8080/login/kakao&response_type=code" 
            class="sns_btn kakao"><img src='../resources/images/button/kakao_login_large_narrow.png' 
            style="display: block; margin: 0 auto; width:300px; height:60px;"></a>
    		</li>
    </ul>
  </div><!-- //#login_container --->
    <script>
        <%-- 로그인 실패 시 메시지가 있는 경우에만 alert 창을 띄웁니다. --%>
        <% if (request.getAttribute("errorMSG") != null) { %>
            var errorMessage = "${errorMSG}";
            alert(errorMessage);
        <% } %>
    </script>
     
   <%@ include file="../common/footer.jsp" %>
</body>
</html>