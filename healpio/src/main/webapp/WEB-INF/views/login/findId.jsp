<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>아이디 찾기 결과</title>
    <link rel='stylesheet' href='../resources/css/findId.css'>
	
    
</head>
<body>
<%@ include file="../common/header.jsp" %>

    <div id="login_container">
        <div class="jumbotron">
            <h2>아이디는 :</h2>
            <br>
            <ul>
                <c:forEach items="${memberList}" var="member" varStatus="status">
                    <li id='id_answer'>${member.member_id } </li><br>
                </c:forEach>
            </ul>
            <h2>입니다</h2> <br>
           <div id="login_btn2">
            <button type="button" class="btn_login" onclick="location.href='/login/login'">로그인페이지</button>
           </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
