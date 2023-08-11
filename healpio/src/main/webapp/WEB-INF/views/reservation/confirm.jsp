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
<c:set var="classVO" value="${ClassVO}" />

	<div class="container">
		<div>
			<h1>예약이 완료 되었습니다</h1>
		</div>
    	<div>
        	<input type="hidden" id="selectedClass" name="class_no" value="${classInfo.class_no}">
			<input type="hidden" id="selectedMaxcount" name="maxcount" value="${classInfo.class_maxcount}">
			<input type="hidden" id="selectedMember" name="member_no" value="${classInfo.member_no}">
            <h2>강좌명 : ${classInfo.class_title}</h2>
       		<h2>강사명 : ${classInfo.nickname}</h2>
       		<h2>운동명 : ${classInfo.class_price}</h2>
       		<h2>강사소개 : ${classInfo.class_introduce}</h2>
       		<h2>강사내용 : ${classInfo.teacher_content}</h2>
       		<h2>가격 : ${classInfo.class_price}</h2>
       		<h2>최대인원 : ${classInfo.class_maxcount}</h2>
   	 	</div>
        <div>
        <div id="time-selection">
        	<h2>날짜 : ${date}</h2>
            <h2>시간 : ${time}</h2>
        </div>
        </div>
    </div>
    <div>
		<c:if test="${memberVo != null}">
		    <c:if test="${memberVo.teacheryn == 'Y'}">
		        <button onclick="window.location.href='../mypage/teacher?member_no=${memberVo.member_no }'">예약확인</button>
		    </c:if>
		    <c:if test="${memberVo.teacheryn == 'N'}">
		        <button onclick="window.location.href='../mypage/student?member_no=${memberVo.member_no }'">예약확인</button>
		    </c:if>
		</c:if>
    </div>
	<button onclick="window.location.href='http://localhost:8080/class/read?class_no=${class_no}'">돌아가기</button>
    
<%@ include file="../common/footer.jsp" %>
<script src="../resources/js/confirm.js"></script>    
</body>
</html>