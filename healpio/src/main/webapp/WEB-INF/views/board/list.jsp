	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
		<link href="../resources/css/list.css" rel="stylesheet"> 
		<script src="https://kit.fontawesome.com/0aadd0de21.js" crossorigin="anonymous"></script>
		
		    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		
	<script>
	function classWirte() {
	  window.location.href = '/class/write?member_no=${memberVo.member_no }';
	}
	</script>
	
	
	
		<script src="../resources/js/list.js"></script>
	</head>
	<body>

	
  	    <%@ include file="../common/header.jsp" %> 
	
	    <div  class='pull' >
		<input type="hidden" name="member_no" value="${memberVo.member_no }">
		<input type="hidden" name="teacheryn" class="teacheryn" value="${memberVo.teacheryn }">
		

	        <div class='header'>

	            <input type="hidden" value="${pageDto.total}">
				<!-- <select> 요소에 onchange 이벤트를 통해 filterByExercise 함수 호출 -->
				<select name='sports' onchange="filterByExercise()">
				  <option value='all'>운동 전체선택</option>
				  <c:forEach items="${exerciseList}" var="ex">
				  <option value="${ex.exercise_name}" ${pageDto.cri.exercise_name ==  ex.exercise_name ? 'selected' : '' }>${ex.exercise_name}</option>
				  </c:forEach>
				</select>

	            
	           
				<jsp:include page="/WEB-INF/views/common/searchForm.jsp" />
	 			
	            <select name='array' onclick="filterByarray()">
	                <option value='recently' ${pageDto.cri.dependsArray == 'recently' ? 'selected' : '' }>최신순</option>
	                <option value='like' ${pageDto.cri.dependsArray == 'like' ? 'selected' : '' }>인기순</option>
	            </select>
	        </div>
	
<div class="main">
    <c:forEach items="${list}" var="li" varStatus="status">
        <div class="contentbox">
           <a href="/class/read?class_no=${li.class_no}">
              <img src="<c:url value="/display">
                   <c:param name="fileName" value="${li.boardFile}"/>
                   </c:url>" 
                   onerror="this.onerror=null;this.src='../resources/images/noimg.png';"
                   class="form-intro-img"
                   width="300" height="300"/> 
           </a>
           <span class="class_title-text">
               <a href="/class/read?class_no=${li.class_no}">${li.class_title}</a>
           </span>
           <hr>
           ${li.nickname} |  
           <a class="exercise-text">${li.exercise_name}</a> |
           <a class="province-text">${li.province}</a><a class="city-text">${li.city}</a><a class="district-text">${li.district}</a>
           <br>
           <div class="heart-array">
           ${li.class_price} 
           <i class="fa-solid fa-heart" ><span class="scrap-count"> ${scrapCountMap[li.class_no]}</span></i>
           </div>
        </div>
    </c:forEach>
</div>


			<div class="footer">
		        <!-- 페이지 번호 출력 -->
		        <jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
	            <button class="regBtn"   onclick="classWirte()">등록하기</button>

		        <%-- <%@ include file="../common/pageNavi.jsp" %> --%>
			</div>
			
	     </div>

	     <%@ include file="../common/footer.jsp" %>
	</body>
	</html>