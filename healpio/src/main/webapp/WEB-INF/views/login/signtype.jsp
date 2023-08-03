<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사학생분류</title>
   <link rel='stylesheet' href='../resources/css/signtype.css'>
         
    
</head>
<body>

<%@ include file="../common/header.jsp" %>

    <div id='login_wrap'>
        <form id="signupForm" action="/login/signup" method="post">
        
             <div id='login1'> 
                <button type="button" id='t_login' onclick="selectUserType('Y')">강사 <br><span id='test'>가입하기</span></button>   
            </div>
            <div id='login2'>
                <button type="button" id='s_login' onclick="selectUserType('N')">학생 <br><span id='test'>가입하기</span></button>
            </div>
            <input type="hidden" name="teacheryn" id="teacheryn" value="">
            <button type="submit" style="display: none;" id="signupButton">가입하기</button>
       
        </form>
    </div>
    
     
    <script>
        function selectUserType(userType) {
            // 선택된 사용자 유형을 숨겨진 입력 필드에 저장
            document.getElementById("teacheryn").value = userType;
            // 폼을 서버로 제출
            document.getElementById("signupForm").submit();
        }
    </script>
    
    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>