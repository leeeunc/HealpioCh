<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카카오 로그인 결과</title>
</head>
<body>
    <h1>카카오 로그인 결과</h1>
    <h3>사용자 정보</h3>
    <ul>
        <li>ID: ${userInfo.id}</li>
        <li>이름: ${userInfo.kakao_account.profile.nickname}</li>
        <li>이메일: ${userInfo.kakao_account.email}</li>
        <!-- 원하는 사용자 정보를 여기에 추가 -->
    </ul>
</body>
</html>
