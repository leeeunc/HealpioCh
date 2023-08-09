<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 버튼 스타일 */
.btnSearch {
    color: #fff;
    background-color: #777; /* 변경: 진한 회색 */
    border-color: #777; /* 변경: 진한 회색 */
    width: 100px; /* 버튼 너비 조정 */
    height: 40px; /* 버튼 높이 조정 */
    border-radius: 8px;
}

/* 버튼 스타일 수정 */
.btnSearch:focus,
.btnSearch:hover {
    color: #fff;
    background-color: #555; /* 변경: 더 진한 회색 */
    border-color: #555; /* 변경: 더 진한 회색 */
}
</style>

</head>
<body>

	<form action="/board/list" 
			method="get" name="searchForm" autocomplete="off" >

	<input type="hidden" name="class_no" value="">
	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
			
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
	    		
	   		 <input type="hidden" id="exercise_name" name="exercise_name" value="${pageDto.cri.exercise_name }">
	   		 
			 <input type="hidden" name="province" id="province" value="${pageDto.cri.province }">
			 <input type="hidden" name="city" id="city" value="${pageDto.cri.city }">
			 <input type="hidden" name="district" id="district" value="${pageDto.cri.district }">
	    
	  </div>
	  <div class="col-sm-3">
	    <button type="submit" class="btnSearch" onclick="go(1)">검색</button>
	  </div>
	</div>
	</form>
	
	

    
	
</body>
</html>