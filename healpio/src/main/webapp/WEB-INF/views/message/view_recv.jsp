<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
	function goBack(url){
		viewForm.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
		viewForm.setAttribute('action', url); // 전송할 url 지정
		
		viewForm.submit();
	
	}
	
	window.onload = function(){
		opener.document.querySelector('.unreadCnt').innerHTML = document.getElementById('newUnreadCnt').value;
	}
</script>
<style>
	.btnWrap{
		display: flex;
		justify-content: center;
	}
	.btnSm{
		margin: 5px;
		width: 70px;
		height: 40px;
		border : none;
		border-radius: 5px;
		background-color: #e7e7e7;
	}
	.btnReply{
		background-color: #30a0e0;
		color: white;
	}
	.viewWrap{
		margin: 20px;
	}
	
	.viewLabel{
		font-weight: bold;
	}
		
	
</style>
</head>
<body>
	
	<div class="viewWrap">
	    <form action="reply" name="viewForm">
			  <input type="hidden" name="message_no" id="message_no" value="${msg.message_no}">
			  <input type="hidden" name="send_time" id="send_time" value="${msg.send_time}">
			  <input type="hidden" name="nickname" id="nickname" value="${memberVo.nickname}">
			  <input type="hidden" id="recv_nick" name="recv_nick" value="${msg.recv_nick}">
			  <input type="hidden" id="send_nick" name="send_nick" value="${msg.send_nick}">
			  <input type="hidden" name="newUnreadCnt" id="newUnreadCnt" value="${newUnreadCnt }">	
			  
			  
	    	<div class="mb-3">
			  <label for="message_title" class="viewLabel">제목</label>
			  <input name="message_title" id="message_title" type="text" class="form-control" readonly value="${msg.message_title}">
			</div>
			<div class="mb-3">
			  <label for="send_nick" class="viewLabel">보낸 사람</label>
			  <input type="text" class="form-control" id="send_nick" name="send_nick" readonly value="${msg.send_nick}">
			</div>
			<div class="mb-3">
			  <label for="message_content" class="viewLabel">내용</label>
			  <textarea class="form-control" id="message_content" name="message_content" rows="11" readonly>${msg.message_content}</textarea>
			</div>
		
			<div class="btnWrap">
				<button type="submit" class="btnReply btnSm">답장</button>		
				<button type="button" class="btnSm" onclick="goBack('list_recv')">목록</button>
				<button class="btnSm" onclick="window.close()">닫기</button>
			</div>
		</form>
	    
  </div>
	

	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>