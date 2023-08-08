<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel='stylesheet' href='../resources/css/signup.css'>
    
    <script src='../resources/js/signup.js'></script>


</head>
<body>

<%@ include file="../common/header.jsp" %>
  <div id='login_wrap'>
    <h1>회원가입</h1>
    <br><br>
    <form action='/login/signup' method='post'>
        <div id='signup_id'>
            <h5>아이디</h5>
            <input type="text" name="signUpId" id="signUpId" value="min2580">
            <input type="button" id="idCheck" value="중복확인">
           <div id="signupMsg"></div> <!-- 중복확인 메시지를 표시할 div -->
           
   		</div>
           
        
        <div id='signup_pw'>
            <h5>비밀번호</h5>
            <input type="password" name="signUpPw" id="signUpPw" value="1234"><br>
            <div id="signupMsg_pw"></div> <!-- 중복확인 메시지를 표시할 div -->
        </div> 
        <div id='signup_name'>
            <h5>이름</h5>
            <input type="text" name="signUpName" id="signUpName" value="민영찬">
        </div> 
        <div id='signup_nick'>
            <h5>닉네임</h5>
            <input type="text" name="signUpNick" id="signUpNick" value="짠돌이">
            <div id="signupMsg_nick"></div> <!-- 중복확인 메시지를 표시할 div -->
        </div> 
        <div id='signup_email'>
            <h5>이메일</h5>
            <input type="email" name="signUpEmail" id="signUpEmail" placeholder=' example@example.com' value="abc@naver.com">
        </div> 
        <div id='signup_phone'>
            <h5>전화번호</h5>
            <input type="text" name="signUpPhone" id="signUpPhone" placeholder=' 하이픈(-)을 제외한 숫자만 입력' value="01088889999">
        </div>  



		<!-- 중복확인 결과를 저장할 hidden input 요소 -->
    	<input type="hidden" name="idCheckRes" id="idCheckRes">
    	
    	 <!-- 숨겨진 입력 필드에 'teacheryn' 값을 저장하는 부분 -->
        <input type="hidden" name="teacheryn" id="teacheryn" value="${param.teacheryn}">
                          
        <div id='signup_form_btn'>
           <button id='signUp' type="submit">회원가입</button>
 		</div>
  </form>
  
 </div>
 <%@ include file="../common/footer.jsp" %>
 
</body>
</html>