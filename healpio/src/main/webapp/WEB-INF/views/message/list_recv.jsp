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
<style>
  h3{
        text-align: center;
        margin: 20px;
        font-family: 'Roboto', sans-serif;
    }
  
    .listWrap{
    	margin: 20px;
    }
</style>
</head>
<body>
	<h3>받은 쪽지함</h3>

	<%-- pageDto : ${pageDto } --%>
<form name="list_recv" method="post">
	<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="nickname" value="${memberVo.nickname }">
	<input type="hidden" name="newUnreadCnt" id="newUnreadCnt" value="${newUnreadCnt }">
	
	<div class="listWrap">
		<div class="list-group w-auto">
		<c:forEach items="${list}" var="recv">
	    	<a onclick="location.href='/message/view_recv?message_no=${recv.message_no}&nickname=${memberVo.nickname }'" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	      	<div class="d-flex gap-2 w-100 justify-content-between">
	        	<div>
	         	 <h6 class="mb-0">${recv.message_title }</h6>
	         	 <p class="mb-0 opacity-75">${recv.send_nick }</p>
	        	</div>
	       	 <small class="opacity-50 text-nowrap">${recv.send_time }</small>
	      	</div>
	    	</a>
	    </c:forEach>
	    </div>
	 </div>
</form>
	
		
	<%@ include file="./pageNavi_msg.jsp" %>

	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>