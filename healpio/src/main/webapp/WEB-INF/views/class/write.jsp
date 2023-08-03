<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
function go(url){
	writeForm.action = url;
	writeForm.submit();
}
</script>
</head>
<body>
<form name="writeForm" method="post" enctype="multipart/form-data">
	강사 이름 <input type="text" name="member_no" id="member_no" value="M000003"><br>
	강의 이름 <input type="text" name="class_title" id="class_title" value="">
	<select name="exercise_no" id="exercise_no">
		<option>운동종목 선택</option>
		<c:forEach items="${exerciseList}" var="exercise">
		<option value="${exercise.exercise_no}">${exercise.exercise_name}</option>
		</c:forEach>
	</select><br>
	강의 지역 <jsp:include page="../common/location.jsp"/>
	대표 사진 <input type="file" name="files" id="files" multiple><br>
	최대 수강 인원 <input type="number" name="class_maxcount" id="class_maxcount"><br>
	한 줄 소개 <input type="text" name="class_introduce" id="class_introduce"><br>
	상세 소개 <input type="text" name="class_content" id="class_content"><br>
	수강료 <input type="text" name="class_price" id="class_price"><br>
	강사 소개 <input type="text" name="teacher_content" id="teacher_content"><br>
	강의 요일<br>
	<input type="checkbox" class="btn-check" name="class_day" id="sunday" value="일" autocomplete="off">
	<label class="btn btn-outline-primary" for="sunday">일</label>
	<input type="checkbox" class="btn-check" name="class_day" id="monday" value="월" autocomplete="off">
	<label class="btn btn-outline-primary" for="monday">월</label>
	<input type="checkbox" class="btn-check" name="class_day" id="tuesday" value="화"  autocomplete="off">
	<label class="btn btn-outline-primary" for="tuesday">화</label>
	<input type="checkbox" class="btn-check" name="class_day" id="wednesday" value="수" autocomplete="off">
	<label class="btn btn-outline-primary" for="wednesday">수</label>
	<input type="checkbox" class="btn-check" name="class_day" id="thursday" value="목" autocomplete="off">
	<label class="btn btn-outline-primary" for="thursday">목</label>
	<input type="checkbox" class="btn-check" name="class_day" id="friday" value="금" autocomplete="off">
	<label class="btn btn-outline-primary" for="friday">금</label>
	<input type="checkbox" class="btn-check" name="class_day" id="saturday" value="토" autocomplete="off">
	<label class="btn btn-outline-primary" for="saturday">토</label><br>
	강의 시간<br>
	<input type="checkbox" class="btn-check" name="class_time" id="t08" value="08:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t08">08:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t09" value="09:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t09">09:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t10" value="10:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t10">10:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t11" value="11:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t11">11:00</label><br>
	<input type="checkbox" class="btn-check" name="class_time" id="t12" value="12:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t12">12:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t13" value="13:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t13">13:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t14" value="14:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t14">14:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t15" value="15:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t15">15:00</label><br>
	<input type="checkbox" class="btn-check" name="class_time" id="t16" value="16:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t16">16:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t17" value="17:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t17">17:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t18" value="18:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t18">18:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t19" value="19:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t19">19:00</label><br>
	<input type="checkbox" class="btn-check" name="class_time" id="t20" value="20:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t20">20:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t21" value="21:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t21">21:00</label>
	<input type="checkbox" class="btn-check" name="class_time" id="t22" value="22:00" autocomplete="off">
	<label class="btn btn-outline-primary" for="t22">22:00</label><br>
	<button type="submit" onclick="go('/class/write')">등록하기</button>
	<button type="button" onclick="#">취소</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>