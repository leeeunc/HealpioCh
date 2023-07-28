<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
        body {
        margin: 0;
        padding: 0;
        height: 100vh; /* 뷰포트 높이의 100%를 사용하여 화면을 꽉 채우도록 설정합니다. */
        display: flex;
        justify-content: center; /* 가로 방향으로 내용을 가운데 정렬합니다. */
        align-items: center; /* 세로 방향으로 내용을 가운데 정렬합니다. */
        }


        .pull{
            border: 1px solid black;
            width: 95%;
            height: 800px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            padding: 10px;

        }

        .image-container{
            max-width: 90%; /* 90% 너비로 설정하여 이미지 크기를 조정합니다. */
            height: auto;
            margin-bottom: 10px;
            /* 이미지들을 동일한 높이로 조정 */
        }

        .img-concert{
            max-width: 90%; /* 90% 너비로 설정하여 이미지 크기를 조정합니다. */
            height: auto;
            margin-bottom: 10px;
            flex-grow: 1; /* 이미지들이 가용 공간을 균등하게 채우도록 설정 */
        }

        .header{
            border: 1px solid;
            width: 100%;
            
        }

        .imgs{
            border: 1px solid black;
            height: 80%;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: stretch;
            
		  display: grid;
	  	  grid-template-columns: repeat(3, 1fr);
	  	  grid-gap: 10px;	
            

              overflow: auto;
            /* 스크롤바의 스타일을 선택적으로 지정 */
		    scrollbar-width: thin; /* 스크롤바의 너비 (thin, auto, 등) */
		    scrollbar-color: red green; /* 스크롤바의 색상 (트랙, 썸네일) */
              
            
        }

        .imgs .img-concert img {
		    width: 200px;
		    height: 200px;
            object-fit: cover;

        }
        .img-concert:nth-child(3n) {
            margin-right: 0;
        }
		.contentbox{
			width: 80%
			height : 80%
		}
		.btnList{
			align: right;
		}
		   /* 한국어 폰트 지정 */
	    select, option {
	      font-family: '나눔고딕', 'Nanum Gothic', 'Helvetica', sans-serif;
	    }
    </style>

      
</head>
<body>

    <div  class='pull' >
        <div class='header'>
            <h3>스포츠 플랫폼</h3>
            <select name='sports' >
                <option value='x'>운동종류</option>
                	<c:forEach items="${exerciseList }" var="exvo">
		                <option value='ko'>${exvo.exercise_name}</option>
					</c:forEach>
            </select>
            
			<jsp:include page="/WEB-INF/views/common/location.jsp"/>

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
                    <img class="img-concert" src="/resources/images/필라테스${index }.jpg" />
				</div>
				
					<div>
					         제목<br>
				    	 강사 | 요가 | 주소<br>
				    </div>
			    
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