<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel='stylesheet' href='../resources/css/findId.css'>
	
</head>
<body>

<%@ include file="../common/header.jsp" %>

    <div id="login_container">
        <div class="text-center">
        	<div id=title>
            <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1><br>
		 </div>           
            <p class="mb-4">※ 이메일을 입력해주세요.</p>
        </div><br>
        <form class="user" action="/login/findId" method="post">
            <div class="form-group">
               <p> <input type="email" class="form-control form-control-user"
                       id="email" aria-describedby="emailHelp" name="email"
                       placeholder="이메일을 입력하세요" required> </p>
            </div><br>
     	<div id="findId_login">
            <button type="submit" class="btn_findId">
                Find ID
            </button>
        <button type="button" class="login_btn1" onclick="location.href='/login/login'" >login</button>
       
        </div>
        </form>
        <br>
        <form class="user" action="/login/findPw" method="post">
            <button type="submit" class="btn_findPw">비밀번호 찾기</button>
        </form>
    
        </div>

 <%@ include file="../common/footer.jsp" %>
</body>
</html>
