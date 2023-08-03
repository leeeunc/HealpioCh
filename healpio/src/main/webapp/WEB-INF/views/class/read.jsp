<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
<script src="https://kit.fontawesome.com/0aadd0de21.js" crossorigin="anonymous"></script>
<script>
function go(url){
	location.href = url;
}

function fetchGet(url, callback){
	try{
		fetch(url)
		// 컨트롤러로부터 JSON 타입의 객체가 반환
		// 객체를 변수명 response에 받아 와서 json() 메소드를 호출
		// json() : JSON 형식의 문자열을 Promise 객체로 반환
		// Promise 객체는 then() 메소드를 사용하여 
		// 비동기 작업의 성공 또는 실패와 관련된 결과를 나타내는 대리자 역할을 수행
		.then(response => response.json())
		// 반환 받은 객체를 매개 변수로 받는 콜백 함수를 호출
		.then(map => callback(map));		
	} catch(e){
		console.log('fetchGet', e)
	}
}

function scrap(class_no){
	fetchGet('/class/scrap?class_no=' + class_no, getFullheart);
}

function cancelScrap(class_no){
	fetchGet('/class/cancelScrap?class_no=' + class_no, getEmptyheart);
}

function getFullheart(map){
	if(map.result=='success'){
		scrapDiv.innerHTML = `이 강의 찜하기 <i class="fa-solid fa-heart" style="color: #ff6666" onclick="cancelScrap('${classVO.class_no}')"></i><br>`;
	} else {
		alert(map.result);
	}
}

function getEmptyheart(map){
	if(map.result=='success'){
		scrapDiv.innerHTML = `이 강의 찜하기 <i class="fa-regular fa-heart" style="color: #ff6666" onclick="scrap('${classVO.class_no}')"></i><br>`;
	} else {
		alert(map.result);
	}
}

$(function(){	
    $('.score').score({
        starColor: "gold", //별 색상
        backgroundColor: "transparent", //배경 색상
        editable: true, //점수 변경 가능 여부
        integerOnly: true, //정수만 설정 가능 여부
        zeroAvailable:false,//0 설정 가능 여부
        send:{
            sendable:true,//전송 가능 여부
            name:"review_star",//전송 가능할 경우 전송될 이름
        },
        display: {
            showNumber: true, //설정된 숫자 표시 가능 여부
            placeLimit: 0, //소수점 자리수 표시 길이
            textColor:"black",//텍스트 색상
        },
        point: {
            max: 5,//최대 점수(data-max로 대체 가능)
            rate: 4,//실제 점수(data-rate로 대체 가능)
        }
    });
    

    $('.avgScore').score({
        editable:false,
        display:{
            showNumber:true,
            placeLimit:1
        }    
    });    
});

function showReview(class_no){
	class_contentDiv.style.display = 'none';
	reviewDiv.style.display = '';
	reservationDiv.style.display = 'none';
	fetchGet('/review/list?class_no=' + class_no, getReviewList);
}

function getReviewList(map){
	reviewDiv.innerHTML = ``;
	reviewDiv.innerHTML += `리뷰 <span style="color: gold">★</span>` + map.avgScore + ` (` + map.reviewCount + `명 참여)<hr>`;
	if(map.reviewList.length!=0){		
		map.reviewList.forEach(reviewVO => {
			reviewDiv.innerHTML += reviewVO.nickname;
			reviewDiv.innerHTML += ` <span style="color: gold">★</span>` + reviewVO.review_star + `<br>`;
			reviewDiv.innerHTML += reviewVO.review_content;
			if(member_no.value==reviewVO.member_no){
				reviewDiv.innerHTML += ` <button type="button" onclick="go('/review/edit?review_no=` + reviewVO.review_no + `')">수정</button>`;
				reviewDiv.innerHTML += ` <button type="button" onclick="go('/review/delete?review_no=` + reviewVO.review_no + `')">삭제</button>`;
			}
			reviewDiv.innerHTML += `<br><br>`;
		})
	} else {
		reviewDiv.innerHTML += `등록된 리뷰가 없습니다.`;
	}
}

function showReservation(){
	class_contentDiv.style.display = 'none';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = '';
}

function showClass_content(class_no){
	class_contentDiv.style.display = '';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = 'none';
}
</script>
</head>
<body>
<c:forEach items="${attachList}" var="attachVO">
<img src='/resources/images/${attachVO.filepath}' alt='${classVO.class_title}' width='300px'><br>
</c:forEach>
${classVO.class_title}<br>
${classVO.nickname}<br>
${classVO.exercise_name}<br>
${classVO.class_introduce}<br>
<div id="scrapDiv">
	이 강의 찜하기
	<c:if test="${scrapYN==0}">
	<i class="fa-regular fa-heart" style="color: #ff6666" onclick="scrap('${classVO.class_no}')"></i>
	</c:if>
	<c:if test="${scrapYN>0}">
	<i class="fa-solid fa-heart" style="color: #ff6666" onclick="cancelScrap('${classVO.class_no}')"></i>
	</c:if>
</div>
<button type="button" onclick="go('/class/edit?class_no=${classVO.class_no}')">수정</button>
<button type="button" onclick="go('/class/delete?class_no=${classVO.class_no}')">삭제</button><br>

<button type="button" id="class_contentBtn" onclick="showClass_content('${classVO.class_no}')">강의소개</button>
<button type="button" id="reviewBtn" onclick="showReview('${classVO.class_no}')">리뷰</button>
<button type="button" id="reservationBtn" onclick="showReservation()">예약</button>
<form action="/review/write">
	<!-- 리뷰쓰기(삭제 예정) -->
	<button type="submit" id="reviewWriteBtn">리뷰쓰기</button>
	<!-- 리뷰 작성시 필요 -->	
	<input type="text" name="class_no" id="class_no" value="${classVO.class_no}">
	<!-- 리뷰 작성,수정,삭제시 필요 -->	
	<input type="text" name="member_no" id="member_no" value="M000002">
</form>

<!-- 강의 소개 -->
<div id="class_contentDiv">
	강의 소개<br>
	${classVO.class_content}<br><br>
	최대 수강 인원<br>
	${classVO.class_maxcount}<br><br>
	수강료<br>
	${classVO.class_price}<br><br>
	강사 소개<br>
	${classVO.teacher_content}<br><br>
</div>

<!-- 리뷰 -->
<div id="reviewDiv" style="display:none">

</div>

<div id="reservationDiv" style="display:none">
	<jsp:include page="../reservation/reservation.jsp"/>
</div>
</body>
</html>