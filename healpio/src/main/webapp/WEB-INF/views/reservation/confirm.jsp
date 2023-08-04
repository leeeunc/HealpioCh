<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<div class="container">
		<div>
		<h1>예약이 완료 되었습니다</h1>
		</div>
        <div>
            <table id="calendar"></table>
            <h2>강좌명 : </h2>
            <h2>강사명 : </h2>
        </div>
        <div>
        <div id="time-selection">
        	<h2>날짜 : <%= request.getParameter("date") %></h2>
            <h2>시간 : <%= request.getParameter("time") %></h2>
        </div>
        </div>
    </div>
    <div>
        <button id="confirm">예약확인</button>
        <button id="confirmback">돌아가기</button>
    </div>
    
<%@ include file="../common/footer.jsp" %>
<script src="../resources/js/confirm.js"></script>    
</body>
</html>