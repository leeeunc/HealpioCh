<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Pioneers</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/write.css">
<script src="https://kit.fontawesome.com/0aadd0de21.js" crossorigin="anonymous"></script>
<script>
window.addEventListener('load', function(){
	let class_day = document.getElementsByName('class_day');
	for(let i=0; i<class_day.length; i++){
		if("${classVO.class_day}".includes(class_day[i].value)){
			class_day[i].setAttribute('checked', true);
		}
	}
	
	let class_time = document.getElementsByName('class_time');
	for(let i=0; i<class_time.length; i++){
		if("${classVO.class_time}".includes(class_time[i].value)){
			class_time[i].setAttribute('checked', true);
		}
	}

	editBtn.addEventListener('click', function(e){
		// 기본 이벤트(새로고침) 제거
		e.preventDefault();
		
		if(!class_title.value){
			alert();
			class_title.focus();
			return;
		}
		
		if(!exercise_no.value){
			alert();
			exercise_no.focus();
			return;
		}
		
		if(!province.value){
			alert();
			sido.focus();
			return;
		}
		
		if(!city.value){
			alert();
			sigugun.focus();
			return;
		}
		
		if(!district.value){
			alert();
			dong.focus();
			return;
		}
		
		if(!class_maxcount.value){
			alert();
			class_maxcount.focus();
			return;
		}
		
		if(!class_introduce.value){
			alert();
			class_introduce.focus();
			return;
		}
		
		if(!class_content.value){
			alert();
			class_content.focus();
			return;
		}
		
		if(!class_price.value){
			alert();
			class_price.focus();
			return;
		}
		
		let class_dayCount = 0;
		let class_day = document.getElementsByName('class_day');
		for(var i=0; i<class_day.length; i++){
			if(eval(class_day[i].checked)==true){
				class_dayCount++;
			}
		}
		if(class_dayCount==0){
			alertDiv.innerHTML = '<div class="alert alert-danger d-flex align-items-center" role="alert"><i class="fa-solid fa-triangle-exclamation"></i> 강의 요일을 선택하세요.</div>';
			alert();
			return;
		}
		
		let class_timeCount = 0;
		let class_time = document.getElementsByName('class_time');
		for(var i=0; i<class_time.length; i++){
			if(eval(class_time[i].checked)==true){
				class_timeCount++;
			}
		}
		if(class_timeCount==0){
			alertDiv.innerHTML = '<div class="alert alert-danger d-flex align-items-center" role="alert"><i class="fa-solid fa-triangle-exclamation"></i> 강의 시간을 선택하세요.</div>';
			alert();
			return;
		}
		
		editForm.action = '/class/edit?class_no=${classVO.class_no}';
		editForm.submit();
	})
})

function alert(){
	alertDiv.style.visibility='visible';
	setTimeout(() => {
		alertDiv.style.visibility='hidden';
	  }, 800)
}

function changeAttach(){
	attachDiv.innerHTML = '';
	files.style.display = 'block';
}
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="container">
<div id="form">
	<div id="form-img">
		<img src="/resources/images/man-5886576_1280.jpg" class="form-img-radius">
	</div>
	
	<div id="form-main" class="form-main-radius">	
		<div id="form-main-title">
		  <h1>강의 등록</h1><hr>
		</div>
		
		<form name="editForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="member_no" id="member_no" value="${memberVo.member_no}">
			
			<div class="row g-3" id="form-main-content1">		  
			  <div class="col-md-8">
			    <label for="class_title" class="form-label"><b>강의명</b></label>
			    <input type="text" class="form-control form-control-sm" name="class_title" id="class_title" value="${classVO.class_title}" maxlength="100">
			  </div>
			  
			  <div class="col-md-4">
			    <label for="exercise_no" class="form-label"><b>강의 종목</b></label>
			    <select class="form-select form-select-sm" name="exercise_no" id="exercise_no">
					<option></option>
					<c:forEach items="${exerciseList}" var="exercise">
						<c:if test="${exercise.exercise_name eq classVO.exercise_name}">
							<option value="${exercise.exercise_no}" selected>${exercise.exercise_name}</option>
						</c:if>
						<c:if test="${exercise.exercise_name ne classVO.exercise_name}">
							<option value="${exercise.exercise_no}">${exercise.exercise_name}</option>
						</c:if>
					</c:forEach>
				</select>
			  </div>
			  
			  <jsp:include page="./location.jsp"/>
			  <div class="contents col-md-5">
			  	<label for="sido" class="form-label"><b>강의 지역</b></label>
				<select class="form-select form-select-sm" id="sido"><option value="">선택</option></select>
			  </div>
			  <div class="contents col-md-3">
			  	<label for="sigugun" class="form-label">　</label>
				<select class="form-select form-select-sm" id="sigugun"><option value=""></option></select>
			  </div>
			  <div class="contents col-md-4">
			  	<label for="dong" class="form-label">　</label>
				<select class="form-select form-select-sm" id="dong"><option value=""></option></select>
			  </div>
			  <input type="hidden" name="province" id="province">
			  <input type="hidden" name="city" id="city">
			  <input type="hidden" name="district" id="district">
			  		  		  
			  <div class="col-md-3">
			    <label for="class_maxcount" class="form-label"><b>최대 수강 인원</b></label>
			    <input type="number" class="form-control form-control-sm" name="class_maxcount" id="class_maxcount" value="${classVO.class_maxcount}" min="1">
			  </div>
			  		  
			  <div class="col-md-9">
				<label for="files" class="form-label"><b>대표 사진</b></label>
				<input class="form-control form-control-sm" type="file" name="files" id="files" multiple style="display:none;" onchange="changeAttach()">
  				
  				<c:if test="${attachList.size()!=1}">
  					<div class="input-group mb-3 input-group-sm mb-3" id="attachDiv">
					  <span class="input-group-text" id="basic-addon1"><label for="files">파일 선택</label></span>
					  <input type="text" class="form-control" value="파일 ${attachList.size()}개" readonly>
					</div>
  				</c:if>
  				<c:if test="${attachList.size()==1}">
  				<c:forEach items="${attachList}" var="attachVO">
					<div class="input-group mb-3 input-group-sm mb-3" id="attachDiv">
					  <span class="input-group-text" id="basic-addon1"><label for="files">파일 선택</label></span>
					  <input type="text" class="form-control" value="${attachVO.filename}" readonly>
					</div>
			    </c:forEach>
  				</c:if>
			  </div>
			  
			  <div class="col-md-12">
				<label for="class_introduce" class="form-label"><b>강의 소개 (한줄)</b></label>
				<input type="text" class="form-control form-control-sm" name="class_introduce" id="class_introduce" value="${classVO.class_introduce}" maxlength="100">
			  </div>
			  
			  <div class="col-md-12">
				<label for="class_content" class="form-label"><b>강의 소개 (상세)</b></label>
				<textarea class="form-control form-control-sm" name="class_content" id="class_content" rows="4" maxlength="1000" placeholder="강의 목표, 강의 내용, 강의 대상 등을 작성해 주세요." style="resize:none;">${classVO.class_content}</textarea>
			  </div>		  
			  		  		  
			  <div class="col-md-12">
				<label for="class_price" class="form-label"><b>수강료</b></label>
				<input type="text" class="form-control form-control-sm" name="class_price" id="class_price" value="${classVO.class_price}" maxlength="25">
			  </div>
			  
			  <div class="col-md-12">
				<label for="teacher_content" class="form-label"><b>강사 소개</b></label>
				<textarea class="form-control form-control-sm" name="teacher_content" id="teacher_content" rows="4" maxlength="1000" placeholder="학력, 경력, 수상 이력 등을 작성해 주세요." style="resize:none;">${classVO.teacher_content}</textarea>
			  </div>
			</div>
			
			<div id="form-main-content2">			
				<label class="form-label"><b>강의 요일</b></label><br>
				<input type="checkbox" class="btn-check" name="class_day" id="sunday" value="일" autocomplete="off">
				<label class="btn btn-sm bg-white" for="sunday">일</label>
				<input type="checkbox" class="btn-check" name="class_day" id="monday" value="월" autocomplete="off">
				<label class="btn btn-sm bg-white" for="monday">월</label>
				<input type="checkbox" class="btn-check" name="class_day" id="tuesday" value="화"  autocomplete="off">
				<label class="btn btn-sm bg-white" for="tuesday">화</label>
				<input type="checkbox" class="btn-check" name="class_day" id="wednesday" value="수" autocomplete="off">
				<label class="btn btn-sm bg-white" for="wednesday">수</label>
				<input type="checkbox" class="btn-check" name="class_day" id="thursday" value="목" autocomplete="off">
				<label class="btn btn-sm bg-white" for="thursday">목</label>
				<input type="checkbox" class="btn-check" name="class_day" id="friday" value="금" autocomplete="off">
				<label class="btn btn-sm bg-white" for="friday">금</label>
				<input type="checkbox" class="btn-check" name="class_day" id="saturday" value="토" autocomplete="off">
				<label class="btn btn-sm bg-white" for="saturday">토</label><br>
				
				<p></p>
				
				<label class="form-label"><b>강의 시간</b></label><br>
				<input type="checkbox" class="btn-check" name="class_time" id="t08" value="08:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t08">08:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t09" value="09:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t09">09:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t10" value="10:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t10">10:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t11" value="11:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t11">11:00</label><br>
				<input type="checkbox" class="btn-check" name="class_time" id="t12" value="12:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t12">12:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t13" value="13:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t13">13:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t14" value="14:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t14">14:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t15" value="15:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t15">15:00</label><br>
				<input type="checkbox" class="btn-check" name="class_time" id="t16" value="16:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t16">16:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t17" value="17:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t17">17:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t18" value="18:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t18">18:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t19" value="19:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t19">19:00</label><br>
				<input type="checkbox" class="btn-check" name="class_time" id="t20" value="20:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t20">20:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t21" value="21:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t21">21:00</label>
				<input type="checkbox" class="btn-check" name="class_time" id="t22" value="22:00" autocomplete="off">
				<label class="btn btn-sm bg-white margin" for="t22">22:00</label>
				
				<br><br><br><br><br><br><br><br><br><br><br><br>
				<div id="alertDiv" style="visibility:hidden">
					<div class="alert alert-danger d-flex align-items-center" role="alert">
					  <i class="fa-solid fa-triangle-exclamation"></i> 입력란을 모두 작성하세요.
					</div>
				</div>
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-danger btn-lg" id="editBtn" style="height:80px;">강의 수정하기</button>
				</div>				
			</div>			
		</form>		
	</div>	
</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>