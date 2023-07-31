<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
        /*  border : 1px solid black; */
          width: 600px;
          height: 700px;
          margin : 0px auto;
          padding: 15px;
          background-color: rgba(128, 128, 128, 0.151);
        }

      [id*="signup"]{
       /* border : 1px solid black; */
        height: 80px;
        width: 500px;
      }

      #id{
        width: 73%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-bottom: 5px;
        border-radius: 7px;
       
      }

      #idcheck{
        border : 1px solid black; 
        background-color: rgb(0, 68, 255);
        color: #fff;
        font-size: 15px;
        border-radius: 7px;
        height: 50px;
        width: 25%;
      }

      #pw{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #name{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #nick{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #phone{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #email{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }
     
      #signup{
        width: 300px;
        height: 50px;
        line-height: 50px;
        background-color: rgb(0, 68, 255);
        font-size: 15px;
        color : white;
        size : 10px;
        text-align: center;
        border-radius: 10px;
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        margin-top : 10px;
        
      }

     

      h1{
        padding-left: 40px;
      }

    </style>
</head>
<body>
  <div id='login_wrap'>
    <h1>회원가입</h1>
    <br><br>
    <form action='' method=''>
        <div id='signup_id'>
            <h5>아이디</h5>
            <input type="text" name="id" id="id" >
            <input type="button" id="idcheck" value="중복확인">
        </div>
        <div id='signup_pw'>
            <h5>비밀번호</h5>
            <input type="password" name="pw" id="pw"><br>
        </div> 
        <div id='signup_name'>
            <h5>이름</h5>
            <input type="text" name="name" id="name">
        </div> 
        <div id='signup_nick'>
            <h5>닉네임</h5>
            <input type="text" name="nick" id="nick">
        </div> 
        <div id='signup_phone'>
            <h5>전화번호</h5>
            <input type="text" name="phone" id="phone" placeholder=' 하이픈(-)을 제외한 숫자만 입력'>
        </div>  
        <div id='signup_email'>
            <h5>이메일</h5>
            <input type="email" name="email" id="email" placeholder=' example@example.com'>
        </div> 

        <div id='signup_form_btn'>
            <input type="submit" id='signup' value="회원가입">
        </div>
    
   
  </form>
    </div>
</body>
</html>