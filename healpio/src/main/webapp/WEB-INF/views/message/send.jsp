<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script type="text/javascript">
	function send(url){
		sendForm.action = url;
		sendForm.submit();

		setTimeout(function() {   
            window.close();
         }, 100);

	}
	


</script>

<style>

	.viewWrap{
		margin: 20px;
	}
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
	
	.viewLabel{
		font-weight: bold;
	}
		
</style>

</head>
<body>

<div class="viewWrap">
<form method="post" action="send" name="sendForm">
    
    
	<div class="mb-3">
	  <label for="title" class="viewLabel">제목</label>
	  <input name="message_title" id="message_title" 
	  type="text" class="form-control">
	</div>
	<div class="mb-3">
	  <label for="writer" class="viewLabel">받는 사람</label>
	  <input type="text" class="form-control" id="recv_nick" name="recv_nick" readonly value="${param.writer}">
	</div>

	<div class="mb-3">
	  <input type="hidden" class="form-control" id="send_nick" name="send_nick" value="${memberVo.nickname}">
	</div>
	<div class="mb-3">
	  <label for="content" class="form-label">내용</label>
	  <textarea class="form-control" id="message_content" name="message_content" rows="10"></textarea>
	</div>

	<div class="btnWrap">
		<button type="submit" class="btnReply btnSm" onclick="send('/message/send'); alert('전송이 완료되었습니다.')">전송</button>	
		<button class="btnSm" onclick="window.close()">닫기</button>
	</div>
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>