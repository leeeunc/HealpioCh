<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    
    <script>
    function go_recv(){
    	let f = document.createElement('form');
        
        let obj;
        obj = document.createElement('input');
        obj.setAttribute('type', 'hidden');
        obj.setAttribute('name', 'nickname');
        obj.setAttribute('value', document.querySelector('#nickname').value);
        
        f.appendChild(obj);
        f.setAttribute('method', 'post');
        f.setAttribute('action', '/message/list_recv');
        f.setAttribute("target", "targetName");
        document.body.appendChild(f);
        
        window.open('', "targetName", "width=500, height=570");
        
        f.submit();
    }

    function go_send(){
    	let f = document.createElement('form');
        
        let obj;
        obj = document.createElement('input');
        obj.setAttribute('type', 'hidden');
        obj.setAttribute('name', 'nickname');
        obj.setAttribute('value', document.querySelector('#nickname').value);
        
        f.appendChild(obj);
        f.setAttribute('method', 'post');
        f.setAttribute('action', '/message/list_send');
        f.setAttribute("target", "targetName");
        document.body.appendChild(f);
        
        window.open('', "targetName", "width=500, height=570");
        
        f.submit();
    }
    </script>
    
    <style>
    .form-control-dark {
  border-color: var(--bs-gray);
}
.form-control-dark:focus {
  border-color: #fff;
  box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);
}

.text-small {
  font-size: 85%;
}

.dropdown-toggle {
  outline: 0;
}


.nav {
  display: flex;
  flex-wrap: nowrap;
  padding-bottom: 1rem;
  margin-left: 120px;
  margin-top: 50px;
  overflow-x: auto;
  text-align: center;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
  justify-content: space-between;
}

.nav-text{
  width: 35%;
  
}
.message{
  margin-left: 120px;
}

.user{
  margin-left: 20px;
}

#message_btn{
  cursor: pointer;
}

#user_btn{
  cursor: pointer;
}
    
  </style>
</head>
<body>
<!-- 
    <div class='header'>
        <div class='headerLogo'>
            <a href='/main'><img src='../resources/images/logo/logo_header.png'></a>
        </div>
        <div class='nav'>
            <ul>
                <li><a href='#'>운동 프로젝트</a></li>
                <li><a href='../board/list'>운동 강사 찾기</a></li>
            </ul>
        </div>

        <input type="hidden" value="${memberVo.nickname }" id="nickname">
        <div class='user'>
        	<c:if test="${memberVo == null}">
            	<a href="../login/login"><img src='../resources/images/icon/header/icon_user.png'></a>
        	</c:if>
        	<c:if test="${memberVo != null}">
        		<c:if test="${memberVo.teacheryn == 'Y'}">
	        		<div class='message'>
			            <img id='message_btn' tabindex="-1" src='../resources/images/icon/header/icon_message.png'>
			            <div class='message_options' id='message_options' style="display: none;">
			                <a href='#' onclick="go_recv()">받은 쪽지함 <span id="unreadCnt" class="unreadCnt">${unreadCnt }</span></a>
			                <a href='#' onclick="go_send()">보낸 쪽지함</a>
			            </div>
			        </div>
            		<img id='user_btn' tabindex="4" src='../resources/images/icon/header/icon_user.png'>
		            <div class='user_options' id='user_options' style="display: none;">
		                    <a href='../mypage/teacher'>마이페이지</a>
		                    <a href='../logout.do'>로그아웃</a>
		            </div>
        		</c:if>
        		<c:if test="${memberVo.teacheryn == 'N'}">
        			<div class='message'>
			            <img id='message_btn' tabindex="-1" src='../resources/images/icon/header/icon_message.png'>
			            <div class='message_options' id='message_options' style="display: none;">
			                <a href='#' onclick="go_recv()">받은 쪽지함 <span style="background-color: #990000; border-radius: 50%;
									font-size: 12px; color: white; display:inline-block; width: 12px;" id="unreadCnt" class="unreadCnt">${unreadCnt }</span></a>
			                <a href='#' onclick="go_send()">보낸 쪽지함</a>
			            </div>
			        </div>
            		<img id='user_btn' tabindex="4" src='../resources/images/icon/header/icon_user.png'>
		            <div class='user_options' id='user_options' style="display: none;">
		                    <a href='../mypage/student'>마이페이지</a>
		                    <a href='../logout.do'>로그아웃</a>
		            </div>
        		</c:if>
        	</c:if>
        </div>
    </div>
  -->
    <main>
 

  <header class="p-3 text-bg">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <img src='../resources/images/logo/logo_header.png'>
        </a>
        <div class='nav-text'>
          <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 mb-md-0">
            <li><a href="#" class="nav-link px-2 text-black">헬스 파이오니어스</a></li>
            <li><a href="../board/list" class="nav-link px-2 text-black">운동 강사 찾기</a></li>
          </ul>
        </div>
        
          <input type="hidden" value="${memberVo.nickname }" id="nickname">
          
          <c:if test="${memberVo == null}">
            	<a href="../login/login"><img src='../resources/images/icon/header/icon_user.png'></a>
       	  </c:if>
       	  <c:if test="${memberVo != null}">
       		<c:if test="${memberVo.teacheryn == 'Y'}">
       		<div class='message'>
		          <div class="dropdown">
		            <img id='message_btn' src='../resources/images/icon/header/icon_message.png' href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <ul class="dropdown-menu">
		              <li><a class="dropdown-item" href="#" onclick="go_recv()">받은 쪽지함 <span class="badge text-bg-secondary unreadCnt">${unreadCnt }</span></a></li>
		              <li><a class="dropdown-item" href="#" onclick="go_send()">보낸 쪽지함</a></li>
		            </ul>
		          </div>
		      </div>
			     <div class='user'>
		            <img id='user_btn' src='../resources/images/icon/header/icon_user.png' href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            <ul class="dropdown-menu">
		              <li><a class="dropdown-item" href="../mypage/teacher?member_no=${memberVo.member_no }">마이페이지</a></li>
		              <li><a class="dropdown-item" href="../logout.do">로그아웃</a></li>
		            </ul>
	      			</div>
	       		</c:if>
	       		<c:if test="${memberVo.teacheryn == 'N'}">
	       			<div class='message'>
			          <div class="dropdown">
			            <img id='message_btn' src='../resources/images/icon/header/icon_message.png' href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            <ul class="dropdown-menu">
			              <li><a class="dropdown-item" href="#" onclick="go_recv()">받은 쪽지함 <span class="badge text-bg-secondary unreadCnt">${unreadCnt }</span></a></li>
			              <li><a class="dropdown-item" href="#" onclick="go_send()">보낸 쪽지함</a></li>
			            </ul>
			          </div>
			      </div>
			     <div class='user'>
			            <img id='user_btn' src='../resources/images/icon/header/icon_user.png' href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            <ul class="dropdown-menu">
			              <li><a class="dropdown-item" href="../mypage/student?member_no=${memberVo.member_no }">마이페이지</a></li>
			              <li><a class="dropdown-item" href="../logout.do">로그아웃</a></li>
			            </ul>
	       			</div>
       			</c:if>
        	</c:if>
       </div>
    </div>
  </header>

  
</main>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
</body>
</html>