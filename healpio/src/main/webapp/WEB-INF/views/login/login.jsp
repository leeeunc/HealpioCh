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
            <li><a href="/login/signtype" class="find_btn find">아이디/비밀번호 찾기</a></li>
            <li><a href="/login/signtype" class="find_btn join">회원가입</a></li>
        </ul>

        <ul id="login_sns">
            <li><a href="#" class="sns_btn naver"><span>네이버로 로그인 하기</span></a></li>
            <li><a href="#" class="sns_btn kakao"><span>카카오로 로그인 하기</span></a></li>
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