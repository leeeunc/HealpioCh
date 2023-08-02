<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
	<form action="/board/list" 
			method="get" name="searchForm" autocomplete="off">
	
	<input type="hidden" name="class_no" value="">
	<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">

	<div class="row g-3 justify-content-center">
	  <div class="col-sm-3">
	    <select name="searchField" class="form-select" 
	    		aria-label="Default select example">
		  <option value="class_title"> <c:if test = "${pageDto.cri.searchField == 'class_title' }"/> 제목</option>
<%--  		  <option value="content" ${pageDto.cri.searchField == 'content' ? 'selected' : ''}>내용</option>
		  <option value="writer" ${pageDto.cri.searchField == 'writer' ? 'selected' : ''}>강사</option> --%>
		</select>
	  </div>
	  <div class="col-sm-6">
	    <label for="searchWord" class="visually-hidden">Password</label>
	    <input name="searchWord" type="text" class="form-control" 
	    		id="searchWord" placeholder="검색어" 
	    		value="${pageDto.cri.searchWord }">
	  </div>
	  <div class="col-sm-3">
	    <button type="submit" class="btn btn-primary mb-3 w-100" onclick="go(1)">검색</button>
	  </div>
	</div>
	</form>
	
	

    
	
</body>
</html>