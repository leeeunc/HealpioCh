<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>아이디 찾기 결과</title>
</head>
<body>
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="jumbotron">
            <h2>아이디는 :</h2>
            <ul>
                <c:forEach items="${memberList}" var="member" varStatus="status">
                    <li>${member.member_id }</li><br />
                </c:forEach>
            </ul>
            <h2>입니다</h2>
            <button type="button" class="btn btn-primary" onclick="location.href='/login/login'">로그인페이지</button>
        </div>
    </div>
</body>
</html>
