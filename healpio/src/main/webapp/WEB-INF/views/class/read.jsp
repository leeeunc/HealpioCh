<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Pioneers</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/read.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
<script src="https://kit.fontawesome.com/0aadd0de21.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99b2ce67f1c87e618b22c2e335a745a6&libraries=services"></script>
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

function scrap(class_no, member_no){
	fetchGet('/class/scrap?class_no=' + class_no + '&member_no=' + member_no, getFullheart);
}

function cancelScrap(class_no, member_no){
	fetchGet('/class/cancelScrap?class_no=' + class_no + '&member_no=' + member_no, getEmptyheart);
}

function getFullheart(map){
	scrapDiv.innerHTML = `<hr>이 강의 찜하기 <i class="fa-solid fa-heart" style="color: #ff6666; cursor: pointer;" onclick="cancelScrap('${classVO.class_no}', '${memberVo.member_no}')"></i>`;
}

function getEmptyheart(map){
	scrapDiv.innerHTML = `<hr>이 강의 찜하기 <i class="fa-regular fa-heart" style="color: #ff6666; cursor: pointer;" onclick="scrap('${classVO.class_no}', '${memberVo.member_no}')"></i>`;
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

function showClass_content(){
	class_contentBtn.classList.add('form-menu-button-clicked');
	teacher_contentBtn.classList.remove('form-menu-button-clicked');
	locationBtn.classList.remove('form-menu-button-clicked');
	reviewBtn.classList.remove('form-menu-button-clicked');
	reservationBtn.classList.remove('form-menu-button-clicked');
	class_contentDiv.style.display = '';
	teacher_contentDiv.style.display = 'none';
	locationDiv.style.display = 'none';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = 'none';
}

function showTeacher_content(){
	class_contentBtn.classList.remove('form-menu-button-clicked');
	teacher_contentBtn.classList.add('form-menu-button-clicked');
	locationBtn.classList.remove('form-menu-button-clicked');
	reviewBtn.classList.remove('form-menu-button-clicked');
	reservationBtn.classList.remove('form-menu-button-clicked');
	class_contentDiv.style.display = 'none';
	teacher_contentDiv.style.display = '';
	locationDiv.style.display = 'none';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = 'none';
}

function showLocation(){
	class_contentBtn.classList.remove('form-menu-button-clicked');
	teacher_contentBtn.classList.remove('form-menu-button-clicked');
	locationBtn.classList.add('form-menu-button-clicked');
	reviewBtn.classList.remove('form-menu-button-clicked');
	reservationBtn.classList.remove('form-menu-button-clicked');
	class_contentDiv.style.display = 'none';
	teacher_contentDiv.style.display = 'none';
	locationDiv.style.display = '';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = 'none';
}

function showReview(class_no, page){
	class_contentBtn.classList.remove('form-menu-button-clicked');
	teacher_contentBtn.classList.remove('form-menu-button-clicked');
	locationBtn.classList.remove('form-menu-button-clicked');
	reviewBtn.classList.add('form-menu-button-clicked');
	reservationBtn.classList.remove('form-menu-button-clicked');
	class_contentDiv.style.display = 'none';
	teacher_contentDiv.style.display = 'none';
	locationDiv.style.display = 'none';
	reviewDiv.style.display = '';
	reservationDiv.style.display = 'none';
	fetchGet('/review/list?class_no=' + class_no, getReviewList);
}

function sortReview(option, page, class_no){
	fetchGet('/review/sort?option=' + option + '&page=' + page + '&class_no=' + class_no, getReviewList);
}

function getReviewList(map){
	reviewDiv.innerHTML = ``;
	reviewDiv.innerHTML += `<h5 style="display:inline"><b>리뷰 <span style="color: gold">★</span>` +  map.avgScore.toFixed(1) + `</b></h5> (` + map.reviewCount + `명 참여)`;
	
	let option1 = "";
	let option2 = "";
	let option3 = "";
	if("highest"===map.sortingOption){
		option2 = "selected";
	} else if("lowest"===map.sortingOption){
		option3 = "selected";
	} else{
		option1 = "selected";
	}
	let reviewSort = 
		`<select class="form-select form-select-sm" style="width:120px; float:right;" id="option" name="option" onchange="sortReview(this.value, 1, '${classVO.class_no}');">
		  <option value="latest"` + option1 + `>최신순</option>
		  <option value="highest"` + option2 + `>별점높은순</option>
		  <option value="lowest"` + option3 + `>별점낮은순</option>
		</select><br><br>`;
	reviewDiv.innerHTML += reviewSort;
	
	if(map.reviewList.length!=0){		
		map.reviewList.forEach(reviewVO => {
			let review = `<table style="width:100%"><tr><td style="width: 85%"><b>`;
			review += reviewVO.nickname;
			review += `</b> <span style="color: gold"> ★</span>` + reviewVO.review_star;
			review += `<br>` + reviewVO.review_content  + `<br><span style="font-size: 0.9em; color: #aaa">` +reviewVO.review_regdate + `</span>`+ `</td>`;
			if(document.querySelector('#member_no').value==reviewVO.member_no){
				review += `<td>`;
				review += `<button type="button" class="btn btn-secondary btn-sm" style="float:right; margin:1px;" onclick="go('/review/delete?review_no=` + reviewVO.review_no + `')">삭제</button>`;
				review += `<button type="button" class="btn btn-danger btn-sm" style="float:right; margin:1px;" onclick="go('/review/edit?review_no=` + reviewVO.review_no + `')">수정</button>`;
				review += `</td>`;
			}
			review += `</tr></table><br>`;
			reviewDiv.innerHTML += review;
		})
		
		let pageblock = 
			`<nav>
			  <ul class="pagination justify-content-center">`;
		if(map.pageDto.prev){
			pageblock +=
				`<li class="page-item" onclick="sortReview('` + map.sortingOption + `', '` + (map.pageDto.startno-1) + `', '${classVO.class_no}')">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>`;
		}
		for(var i=map.pageDto.startno; i<=map.pageDto.endno; i++){
			pageblock +=
				`<li class="page-item" onclick="sortReview('` + map.sortingOption + `', ` + i + `, '${classVO.class_no}')">
					<a class="page-link" style="color: black;" href="#">` + i + `</a>
				</li>`;
		}
		if(map.pageDto.next){
			pageblock +=
				`<li class="page-item" onclick="sortReview('` + map.sortingOption + `', '` + (map.pageDto.endno+1) + `', '${classVO.class_no}')">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>`;
		}
		pageblock +=		    
			  `</ul>
			</nav>`;
		reviewDiv.innerHTML += pageblock;
	} else {
		reviewDiv.innerHTML += `등록된 리뷰가 없습니다.`;
	}
}

function showReservation(){
	class_contentBtn.classList.remove('form-menu-button-clicked');
	teacher_contentBtn.classList.remove('form-menu-button-clicked');
	locationBtn.classList.remove('form-menu-button-clicked');
	reviewBtn.classList.remove('form-menu-button-clicked');
	reservationBtn.classList.add('form-menu-button-clicked');
	class_contentDiv.style.display = 'none';
	teacher_contentDiv.style.display = 'none';
	locationDiv.style.display = 'none';
	reviewDiv.style.display = 'none';
	reservationDiv.style.display = '';
}

window.addEventListener('load', function(){	
	const prevBtn = document.querySelector('#prev');
	const nextBtn = document.querySelector('#next');
	const carousel = document.querySelector('.carousel');

	let index = 0;

    let interval = setInterval(function(){
    	index++;
        if (index>${attachList.size()-1}) {
            index = 0;
        };        
        carousel.style.left = -500 * index + 'px';
    }, 2000)


	prevBtn.addEventListener('click', () => {
		if(index==0){
			return;
		}
		index--;	   
		carousel.style.left = -500 * index + 'px';
	});

	nextBtn.addEventListener('click', () => {
		if(index==${attachList.size()-1}) {
			return;
		}
		index++;
		carousel.style.left = -500 * index + 'px';
	});
})
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="container">
<div id="form">
<div id="form-intro">
	<div id="form-intro-img">
	<div class="carousel">
		<c:forEach items="${attachList}" var="attachVO">
			<img src=
				'<c:url value="/display">
					<c:param name="fileName" value="${attachVO.filepath}"/>
				</c:url>' 
			alt='${classVO.class_title}' class="form-intro-img"/>
		</c:forEach>
	</div>
	</div>
	<c:if test="${attachList.size()!=1}">
	<button id="prev" type="button">&lang;</button>
    <button id="next" type="button">&rang;</button>
    </c:if>
    
	<div id="form-intro-content">
		<h2><b>${classVO.class_title}</b></h2>
		${classVO.nickname} | ${classVO.exercise_name}<br><br>
		<h6><i class="fa-solid fa-quote-left" style="color:#aaa"></i> <i>${classVO.class_introduce}</i> <i class="fa-solid fa-quote-right" style="color:#aaa"></i></h6><br>
		
		<!-- 학생에게만 찜,문의하기 버튼 출력 -->
		<c:if test="${memberVo.teacheryn=='N'}">
		<div id="scrapDiv" style="display:inline;">
			<hr>
			이 강의 찜하기
			<!-- 찜 안한 상태이면 빈 하트 보여주기 -->
			<c:if test="${scrapYN==0}">
			<i class="fa-regular fa-heart" style="color: #ff6666; cursor: pointer;" onclick="scrap('${classVO.class_no}', '${memberVo.member_no}')"></i>
			</c:if>
			<!-- 찜 상태이면  꽉 찬 하트 보여주기 -->
			<c:if test="${scrapYN>0}">
			<i class="fa-solid fa-heart" style="color: #ff6666; cursor: pointer;" onclick="cancelScrap('${classVO.class_no}', '${memberVo.member_no}')"></i>
			</c:if>	
		</div>
		
		　　문의하기
		<i class="fa-regular fa-envelope" style="color: #588ce0; cursor: pointer;" onclick="window.open('/message/send?member_no=${classVO.member_no}&class_title=${classVO.class_title }', ' ','width=500, height=570'); return false"></i>
		</c:if>
		
		<!-- 게시글 작성자에게만 수정,삭제 버튼 출력 -->
		<c:if test="${memberVo.member_no eq classVO.member_no}">
		<hr>
		<div id="onlyWriter">
			<button type="button" class="btn btn-danger" onclick="go('/class/edit?class_no=${classVO.class_no}&member_no=${classVO.member_no}')">수정</button>
			<button type="button" class="btn btn-secondary" onclick="go('/class/delete?class_no=${classVO.class_no}&member_no=${classVO.member_no}')">삭제</button>
		</div>
		</c:if>
	</div>
</div>

<div id="form-menu">
	<button type="button" class="form-menu-button form-menu-button-clicked" id="class_contentBtn" onclick="showClass_content()">강의 소개</button>
	<button type="button" class="form-menu-button" id="teacher_contentBtn" onclick="showTeacher_content()">강사 소개</button>
	<button type="button" class="form-menu-button" id="locationBtn" onclick="showLocation()">위치</button>
	<button type="button" class="form-menu-button" id="reviewBtn" onclick="showReview('${classVO.class_no}')">리뷰</button>
	<button type="button" class="form-menu-button" id="reservationBtn" onclick="showReservation()">예약</button>
</div>

<!-- 강의 소개 -->
<div id="class_contentDiv" style="white-space: pre-line;">
	<h5 style="margin: 0px"><b>강의 소개</b></h5>
	${classVO.class_content}<br><br>
	<h5 style="margin: 0px"><b>최대 수강 인원</b></h5>
	${classVO.class_maxcount}명<br><br>
	<h5 style="margin: 0px"><b>수강료</b></h5>
	${classVO.class_price}
</div>

<!-- 강사 소개 -->
<div id="teacher_contentDiv" style="display:none; white-space: pre-line;">
	<h5 style="margin: 0px"><b>강사 소개</b></h5>
	${classVO.teacher_content}
</div>

<!-- 위치 -->
<div id="locationDiv" style="display:none;">
<div id="mapContainer">
	<h5 style="margin: 0px; display:inline;"><b>위치 </b></h5><i class="fa-solid fa-location-dot" style="color: #588ce0;"></i>${classVO.province} ${classVO.city} ${classVO.district}<br><br>
	<div id="map" style="width:1040px;height:510px;"></div>
<script>
locationBtn.addEventListener('click', function(){	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(province.value + city.value + district.value, function(result, status) {	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
})
</script>
</div>
</div>
<input type="hidden" name="province" id="province" value="${classVO.province}">
<input type="hidden" name="city" id="city" value="${classVO.city}">
<input type="hidden" name="district" id="district" value="${classVO.district}">

<!-- 리뷰 -->
<div id="reviewDiv" style="display:none;">

</div>
<!-- 리뷰 수정,삭제시 필요 -->	
<input type="hidden" name="member_no" id="member_no" value="${memberVo.member_no}">
<%--
<form action="/review/write">
	<!-- 리뷰쓰기 -->
	<button type="submit" id="reviewWriteBtn">리뷰쓰기</button>
	<!-- 리뷰 작성시 필요 -->	
	<input type="text" name="class_no" id="class_no" value="${classVO.class_no}">
	<!-- 리뷰 작성,수정,삭제시 필요 -->	
<input type="text" name="member_no" id="member_no" value="${memberVo.member_no}">
</form>
 --%>
 
<!-- 예약 -->
<div id="reservationDiv" style="display:none">
	<jsp:include page="../reservation/reservation.jsp"/>
</div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>