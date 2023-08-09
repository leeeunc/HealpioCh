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
	<input type="hidden" name="class_no" value="">
	<input type="text" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="text" name="total" value="${pageDto.total }">

	<form action="/board/list" 
			method="get" name="searchForm" autocomplete="off" >
			
 <jsp:include page="/WEB-INF/views/common/location.jsp" />

	<div class="row g-3 justify-content-center">
	  <div class="col-sm-3">
	    <select name="searchField" class="form-select" 
	    		aria-label="Default select example">
		  <option value="c.class_title" ${pageDto.cri.searchField == 'c.class_title' ? 'selected' : ''}>제목</option>
		  <option value="m.nickname" ${pageDto.cri.searchField == 'm.nickname' ? 'selected' : ''}>닉네임</option> 
		</select>
		
	  </div>
	  <div class="col-sm-6">
	    <label for="searchWord" class="visually-hidden">Password</label>
	    <input name="searchWord" type="text" class="form-control" 
	    		id="searchWord" placeholder="검색어" 
	    		value="${pageDto.cri.searchWord }">
	    		
	   		 <input type="text" id="exercise_name" name="exercise_name" value="${pageDto.cri.exercise_name }">
	   		 
			 <input type="text" name="province" id="province" value="${pageDto.cri.province }">
			 <input type="text" name="city" id="city" value="${pageDto.cri.city }">
			 <input type="text" name="district" id="district" value="${pageDto.cri.district }">
	    
	  </div>
	  <div class="col-sm-3">
	    <button type="submit" class="btn btn-primary mb-3 w-100" onclick="go(1)">검색</button>
	  </div>
	</div>
	</form>
	
	

    
	
</body>
</html>