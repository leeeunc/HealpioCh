<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Pioneers</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='resources/css/main.css'>
    <script src='resources/js/main.js'></script>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class='bannerWrap'>
        <div class='bannerList' id='bannerList'>
            <a href='http://naver.com'><img src='resources/images/banner/banner1.png'></a>
            <a href='http://google.com'><img src='resources/images/banner/banner2.png'></a>
            <a href='http://daum.net'><img src='resources/images/banner/banner3.png'></a>
        </div>
        <div class="arrow" id="arrow-left">&lang;</div>
        <div class="arrow" id="arrow-right">&rang;</div>
    </div>

    <div class='iconWrap'>
        <div class='iconText'>운동 바로가기</div>
        <div class='iconList'>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_health.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_crossfit.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_climbing.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_swim.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_yoga.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_badminton.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_taekwondo.png'></a>
            <a href='http://naver.com'><img src='resources/images/icon/quick_button/icon_ski.png'></a>
        </div>
    </div>

    <div class='newWrap'>
        <div class='newText'>따끈따끈! 이 달의 신규 강의</div>
        <div class='newPicList'>
            <a href='http://naver.com'><img src='resources/images/class/thum/climb1.jpg'></a>
            <a href='http://naver.com'><img src='resources/images/class/thum/judo1.jpg'></a>
            <a href='http://naver.com'><img src='resources/images/class/thum/volleyball1.jpg'></a>
        </div>
        <div class='newClassTextList'>
            <a href='http://naver.com'>당신의 한계를 뛰어넘는 도전</a>
            <a href='http://naver.com'>더 강하게! 건강한 생활과 멋진 동료들</a>
            <a href='http://naver.com'>네트 위의 환상적인 순간들</a>
        </div>
        <div class='newExplTextList'>
            <a href='http://naver.com'>강사 누구누구 &nbsp;&nbsp;|&nbsp;&nbsp; 클라이밍</a>
            <a href='http://naver.com'>강사 누구누구 &nbsp;&nbsp;|&nbsp;&nbsp; 유도</a>
            <a href='http://naver.com'>강사 누구누구 &nbsp;&nbsp;|&nbsp;&nbsp; 배구</a>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>