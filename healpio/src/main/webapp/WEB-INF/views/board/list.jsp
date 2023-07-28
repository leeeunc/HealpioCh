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
	 
		<script>
		document.addEventListener("DOMContentLoaded", function () {
			
	    	console.log(hangjungdong.sido);
	    	  // sido option 추가
	    	  hangjungdong.sido.forEach(function (code) {
	    	    document.querySelector("#sido").appendChild(fn_option(code.codeNm, code.codeNm));
	    	  });

	    	  // sido 변경시 시군구 option 추가
	    	  document.querySelector("#sido").addEventListener("change", function () {
	    	    var sigugun = document.querySelector("#sigugun");
	    	    sigugun.style.display = "block";
	    	    sigugun.innerHTML = "";
	    	    sigugun.appendChild(fn_option("", "선택"));

	    	    hangjungdong.sigugun.forEach(function (code) {
	    	      if (document.querySelector("#sido").value == code.sido) {
	    	        sigugun.appendChild(fn_option(code.sigugun, code.codeNm));
	    	      }
	    	    });

	    	    if (document.querySelector("#sido").value == "36") {
	    	      sigugun.style.display = "none";
	    	      sigugun.querySelector("option:nth-child(2)").selected = true;
	    	      sigugun.dispatchEvent(new Event("change"));
	    	    }
	    	  });

	    	  // 시군구 변경시 행정동 옵션추가
	    	  document.querySelector("#sigugun").addEventListener("change", function () {
	    	    var dong = document.querySelector("#dong");
	    	    dong.innerHTML = "";

	    	    hangjungdong.dong.forEach(function (code) {
	    	      if (
	    	        document.querySelector("#sido").value == code.sido &&
	    	        document.querySelector("#sigugun").value == code.sigugun
	    	      ) {
	    	        dong.appendChild(fn_option(code.dong, code.codeNm));
	    	      }
	    	    });

	    	    dong.insertBefore(fn_option("", "선택"), dong.firstChild);
	    	    dong.querySelector("option[value='']").selected = true;
	    	  });

	    	  document.querySelector("#dong").addEventListener("change", function () {
	    	    var sido = document.querySelector("#sido").value;
	    	    var sigugun = document.querySelector("#sigugun").value;
	    	    var dong = document.querySelector("#dong").value;
	    	    var dongCode = sido + sigugun + dong + "00";
	    	  });
	    	  
	    	  
	    	    hangjungdong.sido.forEach(function (code) {
	    	        document.querySelector("#sido").appendChild(fn_option(code.sido, code.codeNm)); // 여기서 code.codeNm 대신 code.sido를 사용합니다.
	    	      });
	    	  
	    	});

		
		
		
		
	    	  function fn_option(code, name) {
	    		    var option = document.createElement("option");
	    		    option.value = code;
	    		    option.text = name; // 여기서 name으로 변경합니다.
	    		    return option;
	    		  }
	    	
	    	
		
		
		  // '운동종류' select 요소를 변경할 때 호출되는 함수
		  function filterByExercise() {
		    const selectedExercise = document.querySelector('select[name="sports"]').value;
		    console.log(selectedExercise);
		    const contentBoxes = document.querySelectorAll('.contentbox');
		
		    for (const box of contentBoxes) {
		      const exerciseText = box.querySelector('.exercise-text').textContent;
		      box.style.display = (exerciseText.includes(selectedExercise)) ? 'block' : 'none';
		    }
		  }

		  
		  // 시도를 선택할 경우 해당 시도만 표시되는 함수
          function filterBylocation(){
        	
              const selectedLocation = document.querySelector('select[name="sido"]').value;
			  
              console.log(selectedLocation);
              const contentBoxes = document.querySelectorAll('.contentbox');

              for(const box of contentBoxes){
                  const locationText = box.querySelector('.location-text').textContent;
                  box.style.display = (locationText.includes(selectedLocation)) ? 'block' : 'none';
              }

            }


		  
		</script>
</head>
<body>
    <div  class='pull' >
        <div class='header'>
            <h3>스포츠 플랫폼</h3>
			<!-- <select> 요소에 onchange 이벤트를 통해 filterByExercise 함수 호출 -->
			<select name='sports' onchange="filterByExercise()">
			  <option value='x'>운동종류</option>
			  <c:forEach items="${exerciseList}" var="exvo">
			    <option value='${exvo.exercise_name}'>${exvo.exercise_name}</option>
			  </c:forEach>
			</select>
            
<%-- 			<jsp:include page="/WEB-INF/views/common/location.jsp" onchange="filterByLocation()"/>
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
					 <div class="location-text">서울특별시</div>
				</div>
            </c:forEach>
 		</div>
 			
		<button type="submit" class="btnList" onclick="">등록하기</button>
			
     </div>
  

<c:forEach items="${list }" var="vo">
  ${vo.class_no } 
  <!-- 	private int class_no ;
	private int location_no ; 
	private int member_no ;
	private String class_title ;
	private String class_content ;
	private String class_introduce ;
	private String class_regdate ;
	private String teacher_content  ;
	private String class_attach ;
	private int class_maxcount ;
	private String class_price ; -->
</c:forEach>

 
</body>
</html>