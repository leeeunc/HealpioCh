<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go(page){
		document.list_recv.pageNo.value = page;
		document.list_recv.submit();
	}
</script>
</head>
<body>

	<!-- 페이지 블럭 생성 -->
	<nav aria-label="Page navigation example">

	  <ul class="pagination justify-content-center pagination-sm">
	    <li class="page-item ${pageDto.prev?'':'disabled' }">
	      <a class="page-link"
	      		<c:if test="${pageDto.prev}">
	      		onclick="go(${pageDto.startNo-1 })"
	      		</c:if>
	      		href="#"><</a>
	    </li>
	    
	    <c:forEach begin="${pageDto.startNo }" 
	    			end="${pageDto.endNo }" 
	    			var="i">
	    
		    <li class="page-item">
		    	<a class="page-link ${pageDto.cri.pageNo==i ? 'active':'' }" 
		    		onclick="go(${i})"
		    		href="#">${i }</a>
		    </li>
	    
	    </c:forEach>
	    
	    <li class="page-item ${pageDto.next?'':'disabled' }">
	      <a class="page-link"
	      		onclick="go(${pageDto.endNo + 1 })" 
	      		href="#">></a>
	    </li>
	  </ul>
	</nav>


</body>
</html>
