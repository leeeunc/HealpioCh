<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
<style type="text/css">
/* 페이지 번호 버튼이 활성화되었을 때의 배경색과 텍스트 색상 수정 */
.page-item .page-link.active {
    background-color: #999;
    border-color: #999;
    color: #fff;
}

/* 페이지 번호 버튼에 호버 효과 추가 */
.page-item .page-link:hover {
    background-color: #ddd;
    border-color: #ddd;
    color: #fff;
}
</style>

  
<script type="text/javascript">
	function go(page){
  	  console.log("go테스트");
		document.searchForm.pageNo.value = page;
		document.searchForm.submit();
	}
</script>
</head>
<body>
	
	<div class="container d-flex justify-content-center">
	
	<!-- 페이지 블럭 생성 -->
	<nav aria-label="Page navigation example ">
	
	
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pageDto.prev?'':'disabled' }">
	      <a class="page-link"
	      		<c:if test="${pageDto.prev}">
	      		onclick="go(${pageDto.startNo-1 })"
	      		</c:if>
	      		href="#">이전</a>
	    </li>
	    
	    <c:forEach begin="${pageDto.startNo }" 
	    			end="${pageDto.endNo }" 
	    			var="i">
	    
		    <li class="page-item">
		    	<a class="page-link  ${pageDto.cri.pageNo==i ? 'active':'' }" 
		    		onclick="go(${i})"
		    		href="#">${i }</a>
		    </li>
	    
	    </c:forEach>
	    
	    <li class="page-item ${pageDto.next?'':'disabled' }">
	      <a class="page-link"
	      		onclick="go(${pageDto.endNo + 1 })" 
	      		href="#">다음</a>
	    </li>
	  </ul>
	</nav>
</div>

</body>
</html>
