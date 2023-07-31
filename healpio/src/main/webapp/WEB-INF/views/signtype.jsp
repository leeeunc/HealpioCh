<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사학생분류</title>
    <style>
     *{
    margin: 0px auto;
    padding: 0px;
    box-sizing: border-box;
    text-decoration: none;
      }

        #login_wrap{
         /* border : 1px solid black; */
          width: 500px;
          height: 700px; 
          margin-top: 100px;   
          background-color: rgba(128, 128, 128, 0.151); 
        }

        #login1{
            width: 100%;
            height: 350px;
        /*   border: 1px solid black; */
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
        }

        #login2{
            width: 100%;
            height: 350px;
        /*   border: 1px solid black; */
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
            
        }

        #t_login{
            width: 60%;
            height: 60%;
            background-color: blue;
            font-size: 50px;
            color : white;
            border-radius: 10px;
           
        }

        #s_login{
            width: 60%;
            height: 60%;
            background-color: blue;
            font-size: 50px;
            color : white;           
            border-radius: 10px;
           
        }

    #test {
        font-size: 25px; /* 작은 글자 크기 설정 */
        }
        
    </style>
</head>
<body>
    <div id='login_wrap'>
        <form action='' method=''>
<div id='login1'> 
    <button id='t_login'>강사 <br><span id='test'>가입하기</span></button>   
</div>

<div id='login2'>
    <button id='t_login'>학생 <br><span id='test'>가입하기</span></button>
  </div>
    </form>
    </div>
</body>
</html>