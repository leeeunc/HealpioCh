<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <style>
        /* RESET */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap'); 
        
        * { margin:0 ; padding:0 ; color:#444444 ; word-break:break-all ; vertical-align:top ;
            font-family:'Noto Sans KR',sans-serif ; text-decoration:none ; font-weight:300 ;
            border:none ; border-radius:0 ; background:none }
            
        html { font-size:10px }
        body { font-size:1rem ; background-color:#ffffff } 
        
        ul , li , dt , dd , dl , ol { list-style:none }
        a , button { cursor:pointer }
        
        .sound , legend { 
            display:block ; overflow:hidden ; width:0 ; height:0 ; 
            position:fixed ; z-index:1 ; left:-1rem ; top:-1rem ;
            font-size:0 ; line-height:0 ; color:transparent 
        }



        /* LOGIN */
        #login_container , #login_form , .line , .input_txt , .login_btn ,
        #login_find , #login_sns , #login_sns > li , .sns_btn { width:100% ; box-sizing:border-box  }

        #login_container { 
            min-width:32rem ; max-width:100rem ;
            margin:auto ; padding:3rem 15% ; 
        }
        #login_container > h1 { 
            margin-bottom:4rem ;
            font-size:2.6rem ; line-height:3rem ; font-weight:500 ; color:#000000 }

        .line , .login_btn , .sns_btn { overflow:hidden ; padding:1rem 2.5rem  ; border-radius:1rem } 
        .line , .sns_btn {  
            margin-bottom:2rem ;
            border:solid 1px rgba(0,0,0,0.1);
        }
        
        .input_txt , .login_btn { line-height:2.8rem }
        .input_txt {
            border:none ; height:2.8rem ; margin-bottom:0.2rem ;
            font-size:1.4rem ; 
        }

        .login_btn {
            background-color:#4285f4 ;
            font-size:1.8rem ; color:#ffffff ; font-weight:500 ; text-align:center ;
        }



        /* LOGIN - FIND */
        #login_find { padding:3.5rem 0 ; overflow:hidden }
        #login_find::after { display:block ; content:"" ; clear:both } 
        #login_find > li { display:block ; width:50% }
        #login_find > li:first-child { float:left ; text-align:left }
        #login_find > li:last-child  { float:right ; text-align:right }
        .find_btn { font-size:1.6rem ; line-height:2rem ; color:#000000 } 
        .find_btn.find { font-weight:400 }
        .find_btn.join { font-weight:600 }



        /* LOGIN - SNS */
        .sns_btn { display:block ; text-align:center }
        .sns_btn.kakao { margin-bottom:0 }
        .sns_btn > span {
            position:relative ;
            display:inline-block ; margin:auto ; padding:0 0 0.2rem 3.5rem ;
            font-size:1.6rem ; line-height:2.8rem ; font-weight:400 ; color:#000000
        }
        .sns_btn > span::before {
            display:block ; overflow:hidden ; content:"" ; border-radius:0.4rem ;
            width:2.4rem ; height:2.4rem ;
            font-size:1.6rem ; line-height:2.2rem ; font-weight:600 ; ; text-align:center ;
            position:absolute ; left:0 ; top:50% ; transform:translateY(-50%) ;
        }
        .sns_btn.naver > span::before {
            content:"N" ;
            color:#ffffff ;
            background-color:#00c63b ;
        }
        .sns_btn.kakao > span::before {
            content:"K" ;
            color:#000000 ;
            background-color:#ffde00 ;
        }
        
    </style>
</head>
<body>

    <div id="login_container">
        <div id="msg"></div>
        <h1>로그인</h1>
        <form id="login_form" action="/loginAction" method="post">
            <fieldset>
                <legend>로그인</legend>
                <div class="line id">
                    <label for="id" class="sound">아이디</label>
                    <input type="text" id="id" name="id" class="input_txt" placeholder="아이디" value="member1" />
                </div>
                <div class="line pw">
                    <label for="pw" class="sound">비밀번호</label>
                    <input type="password" id="pw" name="pw" class="input_txt" placeholder="비밀번호" value="password" />
                </div>
                <button type="submit" class="login_btn">로그인</button> 
            </fieldset>
        </form>

        <ul id="login_find">
            <li><a href="/signtype" class="find_btn find">아이디/비밀번호 찾기</a></li>
            <li><a href="/signtype" class="find_btn join">회원가입</a></li>
        </ul>

        <ul id="login_sns">
            <li><a href="#" class="sns_btn naver"><span>네이버로 로그인 하기</span></a></li>
            <li><a href="#" class="sns_btn kakao"><span>카카오로 로그인 하기</span></a></li>
        </ul>

    </div><!-- //#login_container --->

    <script>
        <%-- 로그인 실패 시 메시지가 있는 경우에만 alert 창을 띄웁니다. --%>
        <% if (request.getAttribute("errorMSG") != null) { %>
            var errorMessage = "${errorMSG}";
            alert(errorMessage);
        <% } %>
    </script>
    
</body>
</html>