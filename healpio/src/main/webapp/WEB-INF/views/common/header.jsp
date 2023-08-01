<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='resources/css/header.css'>
</head>
<body>
    <div class='header'>
        <div class='headerLogo'>
            <img src='resources/images/logo/logo_header.png'>
        </div>
        <div class='nav'>
            <ul>
                <li><a href='#'>운동 프로젝트</a></li>
                <li><a href='board/list'>운동 강사 찾기</a></li>
            </ul>
        </div>
        <div class='user'>
        	<c:if test="${member == null}">
            	<a href="/login"><img src='resources/images/icon/header/icon_user.png'></a>
        	</c:if>
        	<c:if test="${member != null}">
        		<c:if test="${teacheryn == 'Y'}">
            		<a href="/teacher/mypage"><img src='resources/images/icon/header/icon_user.png'></a>
        		</c:if>
        		<c:if test="${teacheryn == 'N'}">
            		<a href="/student/mypage"><img src='resources/images/icon/header/icon_user.png'></a>
        		</c:if>
        	</c:if>
        </div>
    </div>
    
</body>
</html>