<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="/resources/css/list.css" rel="stylesheet"> 
	<script src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
	<script src="/resources/js/list.js"></script>
</head>
<body>
    <div  class='pull' >
<%--     <jsp:include page="/WEB-INF/views/common/searchForm.jsp" /> --%>
        <div class='header'>
            <h3>스포츠 플랫폼</h3>
			<!-- <select> 요소에 onchange 이벤트를 통해 filterByExercise 함수 호출 -->
			<select name='sports' onchange="filterByExercise()">
			  <option value='x'>운동종류</option>
			  <c:forEach items="${exerciseList}" var="exvo">
			    <option value='${exvo.exercise_name}'>${exvo.exercise_name}</option>
			  </c:forEach>
			</select>
            
<%--  			<jsp:include page="/WEB-INF/views/common/location.jsp" onchange="filterByLocation()"/>
 --%>

   <select id="sido" name="sido" onchange="filterBylocation()">
      <option value="">시도 선택</option>
    </select>
    <select id="sigugun">
      <option value="">시군구 선택</option>
    </select>
    <select id="dong">
      <option value="">읍면동 선택</option>
    </select>



            <select name='search' >
                <option value='x'>제목</option>
                <option value='ko'>닉네임</option>
            </select>
            <input type='text'>
            <button type="submit" class="" onclick="go(1)">검색</button>

            <select name='array' >
                <option value='x'>인기순</option>
                <option value='ko'>최신순</option>
            </select>
        </div>

        <div class='imgs'>

            <c:forEach var="index" begin="1" end="6">
            <c:if test="${index <= list.size()}"> <!-- 리스트 크기를 벗어나지 않도록 출력 -->
				<div class="contentbox">
					  <div class="imgbox">
					    <img class="img-concert" src="/resources/images/필라테스${index}.jpg" />
					  </div>
					  
					  <c:forEach items="${list}" var="li" varStatus="status">
					    <c:if test="${status.index + 1 == index}">
					      ${li.class_title}<br>
					    </c:if>
					  </c:forEach>
					  
					 ==============
					 <br>강사 <br>
					 ==============
					 <div class="exercise-text">요가</div>
					 ==============
					 <div class="location-text">서울특별시 서대문구 북가좌동</div>
				</div>
			</c:if>
            </c:forEach>
 		</div>
 			
 		<!-- 숨겨진 폼 필드와 검색 폼 추가 -->
        <form id="searchForm" method="GET" action="/test/test.jsp">
            <input type="hidden" id="pageNo" name="pageNo" value="${cri.pageNo}" />
        </form>

        <!-- 페이지 번호 출력 -->
        <jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
        
     </div>
  
 
</body>
</html>