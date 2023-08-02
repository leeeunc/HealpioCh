<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>예약이 완료 되었습니다</h1>
        <div>
            <table id="calendar"></table>
            <h2>강좌명 : </h2>
            <h2>강사명 : </h2>
        </div>
        <div>
        <div id="time-selection">
        	<h2>날짜 : </h2>
            <h2>시간 : </h2>
        </div>
        </div>
    </div>
    <div>
        <button id="reserve" disabled>예약확인</button>
        <button id="reserve" disabled>돌아가기</button>
    </div>
</body>
</html>