<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
<script>
window.addEventListener('load', function(){
	// 모달창 열기
	const myModal = new bootstrap.Modal('#myModal', {
		keyboard: false
	})
	myModal.show();
})

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
            showNumber: false, //설정된 숫자 표시 가능 여부
            placeLimit: 0, //소수점 자리수 표시 길이
            textColor:"black",//텍스트 색상
        },
        point: {
            max: 5,//최대 점수(data-max로 대체 가능)
            //rate: 4,//실제 점수(data-rate로 대체 가능)
        }
    });
})
</script>
</head>
<body>
<form name="writeForm" action="/review/editAction">
<div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 쓰기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="history.go(-1)"></button>
      </div>
      <div class="modal-body">
      	만족도를 별점으로 나타내 주세요.<br>
      	<div class="score" data-max="5" data-rate="${reviewVO.review_star}"></div><br><br>
      	<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">수강 후기를 구체적으로 작성해 주세요. (100자 이내)</label>
		  <textarea class="form-control" name="review_content" id="review_content" rows="4" maxlength="100" style="resize:none;">${reviewVO.review_content}</textarea>
		  <input type="hidden" name="review_no" id="review_no" value="${reviewVO.review_no}">
		  <input type="hidden" name="class_no" id="class_no" value="${reviewVO.class_no}">
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="history.go(-1)">취소</button>
      </div>
    </div>
  </div>
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>