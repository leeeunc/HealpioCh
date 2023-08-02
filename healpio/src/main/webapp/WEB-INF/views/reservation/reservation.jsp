<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/css/reservation.css" rel="stylesheet"> 
	<script src="/resources/js/reservation.js"></script>
</head>
<body>
    <div class="container">
        <div>
            <table id="calendar"></table>
        </div>
        <div id="time-selection"></div>
    </div>
    <div>
        <button id="reserve" disabled>예약하기</button>
    </div>
    <div id="modal"> <!-- 모달 창을 감싸는 부모 요소 -->
        <div id="modal-content"> <!-- 모달 내용을 담는 요소 -->
            <p id="confirmation-text"></p>
            <button id="confirm">예</button>
            <button id="cancel">아니오</button>
        </div>
    </div>
</body>

</html>