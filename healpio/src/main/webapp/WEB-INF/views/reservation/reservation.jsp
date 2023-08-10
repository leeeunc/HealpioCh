<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../resources/css/reservation.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <div>
            <table id="calendar"></table>
        </div>
        <div id="time-selection">
        </div>
    </div>
    <form id="reservationForm" action="/reservation/confirm" method="POST">
		    <input type="text" id="selectedDate" name="date" value="${reservationVO.reservation_date}">
		    <input type="text" id="selectedTime" name="time" value="${reservationVO.reservation_time}">
		    <input type="text" id="selectedClass" name="class_no" value="${classVO.class_no}">
		    <input type="text" id="selectedMaxcount" name="maxcount" value="${classVO.class_maxcount}">
		    <input type="text" id="selectedMember" name="member_no" value="${classVO.member_no}">
    	<div>
	        <button id="reserve" type="submit" disabled>예약하기</button>
	    </div>
    </form>
    
    
    <div id="myModal" class="modal">
  		<div id="modal"> <!-- 모달 창을 감싸는 부모 요소 -->
			<div id="modal-content" class="modal-content">
			    <span class="close">&times;</span> <!-- 닫기 버튼 -->
	    		<p id="confirmation-text"></p>
	            <button id="confirm">예</button>
	            <button id="cancel">아니오</button>
			</div>
		</div>
	</div>
<script src="../resources/js/reservation.js"></script>
</body>
</html>