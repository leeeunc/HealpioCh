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
    <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
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
		    <input type="hidden" id="selectedDate" name="date" value="${reservationVO.reservation_date}">
		    <input type="hidden" id="selectedTime" name="time" value="${reservationVO.reservation_time}">
		    <input type="hidden" id="selectedClass" name="class_no" value="${classVO.class_no}">
		    <input type="hidden" id="selectedMaxcount" name="maxcount" value="${classVO.class_maxcount}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.member_no}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.class_title}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.class_content}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.class_introduce}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.teacher_content}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.nickname}">
		    <input type="hidden" id="selectedMember" name="member_no" value="${classVO.exercise_name}">
    		<input type="hidden" name="member_no" value="${memberVo.member_no }">
			<input type="hidden" name="teacheryn" class="teacheryn" value="${memberVo.teacheryn }">
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