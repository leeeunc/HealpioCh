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

      #signUpId{
        width: 73%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-bottom: 5px;
        border-radius: 7px;
       
      }

      #idCheck{
        border : 1px solid black; 
        background-color: rgb(0, 68, 255);
        color: #fff;
        font-size: 15px;
        border-radius: 7px;
        height: 50px;
        width: 25%;
      }

      #signUpPw{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #signUpName{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #signUpNick{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #signUpPhone{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }

      #signUpEmail{
        width: 100%;
        height: 50px;
        line-height: 50px;
        border: 1px solid rgba(128, 128, 128, 0.267);
        margin-top: 5px;
        border-radius: 7px;
      }
     
      #signUp{
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

     #signupMsg{
     	color : red;
     	/* border : 1px solid blue; */
     	text-align: right;
     }

      h1{
        padding-left: 40px;
      }

    </style>
    
    <script>
window.addEventListener('load', function() {
  // 중복확인 버튼 클릭 이벤트 리스너 등록
  document.getElementById('idCheck').addEventListener('click', function() {
    checkIdDuplicate();
  });

  function checkIdDuplicate() {
    // 입력한 아이디 값 가져오기
    let signUpId = document.getElementById('signUpId').value;

    // 입력체크
    if (!signUpId) {
      signupMsg.innerHTML = '아이디를 입력해주세요';
      return;
    }

    // AJAX 요청을 보낼 데이터 준비
    let data = { member_id: signUpId };

    // AJAX 요청
    fetch('/idCheck', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((result) => {
        // 응답 데이터 처리
        if (result.result) {
          // 아이디 사용 가능한 경우
          document.getElementById('idCheckRes').value = '1';
          signupMsg.innerHTML = '사용 가능한 아이디입니다.';
        } else {
          // 아이디 사용 불가능한 경우
          document.getElementById('idCheckRes').value = '0';
          signupMsg.innerHTML = '이미 사용 중인 아이디입니다.';
        }
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
  
  // fetch를 이용한 AJAX POST 요청을 처리하는 함수 정의
  function fetchPost(url, data, callback){
	  fetch(url, {
		  method : 'POST',
		  headers : {
			  'Content-Type' : 'application/json',
		  },
		  body : JSON.stringify(data),
	  })
	  .then((response) => response.json())
	  .then(callback)
	  .catch((error) => {
		  console.error('Error : ', error);
	  });
  }
  

  document.getElementById('signUp').addEventListener('click', function(e) {
      // 이벤트 초기화
      e.preventDefault();

      let signUpId = document.getElementById('signUpId').value;
      let signUpPw = document.getElementById('signUpPw').value;
      let signUpName = document.getElementById('signUpName').value;
      let signUpNick = document.getElementById('signUpNick').value;
      let signUpPhone = document.getElementById('signUpPhone').value;
      let signUpEmail = document.getElementById('signUpEmail').value;

      // 입력값 검사
      if (!signUpId || !signUpPw || !signUpName || !signUpNick || !signUpPhone || !signUpEmail) {
          signupMsg.innerHTML = '모든 정보를 입력해주세요.';
          return;
      }

      // 아이디 중복체크 확인
      if (idCheckRes.value !== '1') {
          signupMsg.innerHTML = '아이디 중복체크를 해주세요';
          return;
      }

      let data = {
          member_id: signUpId,
          member_pw: signUpPw,
          member_name: signUpName,
          nickname: signUpNick,
          phonenumber: signUpPhone,
          email: signUpEmail
      };

      // 회원가입 요청
      fetch('/register', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
      })
      .then((response) => response.json())
      .then((result) => {
          if (result.result === 'success') {
              location.href = '/login';
          } else {
              signupMsg.innerHTML = result.msg;
          }
      })
      .catch((error) => {
          console.error('Error : ', error);
      });
  });

});

</script>

    
    
    
</head>
<body>
  <div id='login_wrap'>
    <h1>회원가입</h1>
    <br><br>
    <form action='' method=''>
        <div id='signup_id'>
            <h5>아이디</h5>
            <input type="text" name="signUpId" id="signUpId" value="member1">
            <input type="button" id="idCheck" value="중복확인">
           <div id="signupMsg"></div> <!-- 중복확인 메시지를 표시할 div -->
   		</div>
        
        <!-- 중복확인 결과를 저장할 hidden input 요소 -->
    	<input type="hidden" name="idCheckRes" id="idCheckRes">
        
        
        <div id='signup_pw'>
            <h5>비밀번호</h5>
            <input type="password" name="signUpPw" id="signUpPw"><br>
        </div> 
        <div id='signup_name'>
            <h5>이름</h5>
            <input type="text" name="signUpName" id="signUpName">
        </div> 
        <div id='signup_nick'>
            <h5>닉네임</h5>
            <input type="text" name="signUpNick" id="signUpNick">
        </div> 
        <div id='signup_phone'>
            <h5>전화번호</h5>
            <input type="text" name="signUpPhone" id="signUpPhone" placeholder=' 하이픈(-)을 제외한 숫자만 입력'>
        </div>  
        <div id='signup_email'>
            <h5>이메일</h5>
            <input type="email" name="signUpEmail" id="signUpEmail" placeholder=' example@example.com'>
        </div> 

        <div id='signup_form_btn'>
           <button id='signUp' type="submit">회원가입</button>
 		</div>
  </form>
  
  <!-- 회원가입 시 입력 정보 체크 메시지를 표시할 영역 -->
  <div id="signgupMsg"></div>
 </div>

</body>
</html>