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
  
  function addHyphenToPhoneNumber() {
	    let phoneNumber = document.getElementById('signUpPhone').value;
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    document.getElementById('signUpPhone').value = phoneNumber;
	  }

	  // 전화번호 입력란에 onblur 이벤트 핸들러 등록
	  document.getElementById('signUpPhone').addEventListener('blur', function() {
	    addHyphenToPhoneNumber();
	  });

	  // 폼을 제출하기 전에 전화번호에 하이픈을 추가합니다.
	  addHyphenToPhoneNumber();

  document.getElementById('signUp').addEventListener('click', function(e) {
      // 이벤트 초기화
      e.preventDefault();
      

      let signUpId = document.getElementById('signUpId').value;
      let signUpPw = document.getElementById('signUpPw').value;
      let signUpName = document.getElementById('signUpName').value;
      let signUpNick = document.getElementById('signUpNick').value;
      let signUpPhone = document.getElementById('signUpPhone').value;
      let signUpEmail = document.getElementById('signUpEmail').value;
      let teacheryn = document.getElementById('teacheryn').value;
	
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
          email: signUpEmail,
          teacheryn : teacheryn
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
              location.href = '/login/login';
          } else {
              signupMsg.innerHTML = result.msg;
          }
      })
      .catch((error) => {
          console.error('Error : ', error);
      });
  });
  
	//'teacheryn' 값을 설정하는 함수를 추가합니다.
  function setTeacherynValue(value) {
      document.getElementById("teacheryn").value = value;
  }


});
