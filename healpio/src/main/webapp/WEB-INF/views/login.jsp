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
      *{
    margin: 0px auto;
    padding: 0px;
    box-sizing: border-box;
    text-decoration: none;
      }

        body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #fff;
      }

        #login_wrap{
         /* border : 1px solid black; */
          width: 400px;
          height: 500px;
          margin : 0px auto;
          padding: 20px;
          background-color: rgba(128, 128, 128, 0.151); 
        }

      #login_form_input{
     
       /* border : 1px solid black; */
        height: 130px;
        width: 350px;
      }

      #id{
        width: 300px;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-bottom: 5px;
        border-radius: 7px;
       
       
      }

      #pw{
        width: 300px;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
        
      }

      #login_form_btn{
        width: 350px;
        height: 60px;
        line-height: 50px;
     /*   border : 1px solid black; */

      }

      #login_form_btn{
        width: 300px;
        height: 50px;
        line-height: 50px;
        background-color: rgb(0, 68, 255);
        color : white;
        font-size : 20px;
        text-align: center;
        border-radius: 10px;
      }

      #login_link{
        width: 350px;
        height: 50px;
        line-height: 50px;
      /*  border : 1px solid black; */
      }

      #idfind{
       padding-left: 10px;
       padding-right: 25px;
      /* border : 1px solid red; */

      }

      #signup{
        padding-left : 25px;
        padding-right : 10px;
       /* border : 1px solid red; */
      }

      #idfind{
        width: 190px;
        height: 40px;
      }

      #signup{
        width: 110px;
        height: 40px;
      }

      #login_type{
       /* border: 1px solid black; */
        width: 350px;
        height: 150px;
    
      }
      
      #naverbtn{
        width: 300px;
        height: 40px;
        line-height: 40px;
        border : 1px solid rgba(128, 128, 128, 0.267);
        margin : 5px;
        border-radius: 10px;
      }

      #kakaobtn{
        width: 300px;
        height: 40px;
        line-height: 40px;
        border : 1px solid rgba(128, 128, 128, 0.267);
        margin : 5px;
        border-radius: 10px;
      }

      h1{
        padding-left: 20px;
      }

    </style>
    
    
   
</head>
<body>
 <div id='login_wrap'>
 	<div id="msg"></div>
    <h1>로그인</h1>
    <br><br>
    <form action="/loginAction" method="post">
        <div id='login_form_input'>
            <input type="text" name="id" id="id" placeholder='아이디' value="member1"><br>
            <input type="password" name="pw" id="pw" placeholder='비밀번호' value="password">
        </div>
  
        <button type="submit" id='login_form_btn'>로그인</button>
      </form>
      
		
    <div id='login_link'>
      <a href='#' id='idfind'>아이디/비밀번호 찾기</a>  
        <a href='#' id='signup'>회원가입</a>
    </div>
    <div id='login_type'>
        <input type="button" id="naverbtn" value="네이버로 로그인하기"><br>
        <input type="button" id="kakaobtn" value="카카오로 로그인하기">
    </div>
    </div>
    
    <script>
    <%-- 로그인 실패 시 메시지가 있는 경우에만 alert 창을 띄웁니다. --%>
    <% if (request.getAttribute("errorMSG") != null) { %>
        var errorMessage = "${errorMSG}";
        alert(errorMessage);
    <% } %>
</script>
   
</body>
</html>