window.addEventListener('load', function() {
	
	// 아이디와 비밀번호의 정규식을 설정합니다.
	  const idRegex = /^[a-zA-Z0-9]{6,12}$/; // 6~12 글자의 영문 소문자와 숫자 조합
	  const pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/; // 6~12 글자의 영문과 숫자 조합
	  
	  const signUpIdInput = document.getElementById('signUpId'); // 아이디 입력 요소 가져오기
	  const signUpPwInput = document.getElementById('signUpPw'); // 비밀번호 입력 요소 가져오기


	const signUpNickInput = document.getElementById('signUpNick');
	const signupMsgNick = document.getElementById('signupMsg_nick');
	
	// 닉네임 입력란에 입력 내용이 변경될 때 이벤트 처리
	  signUpNickInput.addEventListener('input', function() {
	    const signUpNick = signUpNickInput.value;

	    // 입력 체크
	    if (!signUpNick) {
	      signupMsgNick.innerHTML = '';
	      return;
	    }

	    // AJAX 요청을 보낼 데이터 준비
	    const data = { nickname: signUpNick };

	    // AJAX 요청
	    fetch('/nickCheck', {
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
	          // 닉네임 사용 가능한 경우
	          signupMsgNick.innerHTML = '사용 가능한 닉네임입니다.';
	        } else {
	          // 닉네임 사용 불가능한 경우
	          signupMsgNick.innerHTML = '중복된 닉네임입니다.';
	        }
	      })
	      .catch((error) => {
	        console.error('에러:', error);
	      });
	  });

	
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
		  
		  // 입력값 가져오기
		  const signUpId = document.getElementById('signUpId').value;
		  const signUpPw = document.getElementById('signUpPw').value;
		  const signUpPwCheck = document.getElementById('signUpPwCheck').value;
		  
		  // 유효성 검사 수행
		  if (!idRegex.test(signUpId)) {
			  showAlert('아이디 형식을 확인하세요.');
			  return false;
		  }
		  
		  if (!pwRegex.test(signUpPw)) {
			  showAlert('비밀번호 형식을 확인하세요.');
			  return false;
		  }
		  
		  if (signUpPw !== signUpPwCheck) {
			  showAlert('비밀번호가 일치하지 않습니다.');
			  return false;
		  }
		  register();
	  });
	  
  function register(){
      

      let signUpId = document.getElementById('signUpId').value;
      let signUpPw = document.getElementById('signUpPw').value;
      let signUpPwCheck = document.getElementById('signUpPwCheck').value;
      let signUpName = document.getElementById('signUpName').value;
      let signUpNick = document.getElementById('signUpNick').value;
      let signUpPhone = document.getElementById('signUpPhone').value;
      let signUpEmail = document.getElementById('signUpEmail').value;
      let teacheryn = document.getElementById('teacheryn').value;
	
      // 입력값 검사
      if (!signUpId || !signUpPw || !signUpPwCheck || !signUpName || !signUpNick || !signUpPhone || !signUpEmail) {
    	  showAlert('모든 정보를 입력해주세요.');
          return false;
      }

      // 아이디 중복체크 확인
      if (idCheckRes.value !== '1') {
          signupMsg.innerHTML = '아이디 중복체크를 해주세요';
          return false;
      }
      
      // 비밀번호 확인 체크
      if(signupMsg_pwCheck.innerHTML !== '비밀번호가 일치합니다.'){
    	  showAlert('비밀번호가 일치하지 않습니다.');
    	  return false;
      }
      
   // 닉네임 중복체크 확인
      if (signupMsgNick.innerHTML === '중복된 닉네임입니다.') {
        showAlert('닉네임이 중복되었습니다. 다시 확인해주세요.');
        return false;
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
        	  // 회원가입이 성공한 경우 알림창 띄우기
        	  showAlert('회원가입이 완료되었습니다.');
              location.href = '/login/login';
          } else {
              signupMsg.innerHTML = result.msg;
          }
      })
      .catch((error) => {
          console.error('Error : ', error);
      });
  };
  
//서버로부터 받은 메시지를 이용하여 알림창을 띄우는 함수
  function showAlert(message) {
    alert(message);
  }
  
	//'teacheryn' 값을 설정하는 함수를 추가합니다.
  function setTeacherynValue(value) {
      document.getElementById("teacheryn").value = value;
  }

  
  
  // 아이디 입력란에 입력 내용이 변경될 때 이벤트 처리
  signUpIdInput.addEventListener('input', function() {
    const signUpId = signUpIdInput.value;

    // 아이디 형식 체크
    if (!idRegex.test(signUpId)) {
      signupMsg.innerHTML = '아이디는 영문과 숫자 조합으로 6~12글자여야 합니다.';
    } else {
      signupMsg.innerHTML = '';
    }
  });

  // 비밀번호 입력란에 입력 내용이 변경될 때 이벤트 처리
  signUpPwInput.addEventListener('input', function() {
    const signUpPw = signUpPwInput.value;

    // 비밀번호 형식 체크
    if (!pwRegex.test(signUpPw)) {
      signupMsg_pw.innerHTML = '비밀번호는 영문과 숫자 조합으로 6~12글자여야 합니다.';
    } else {
      signupMsg_pw.innerHTML = '';
    }
  });
  

  
  
//비밀번호 확인 입력란 요소 가져오기
  const signUpPwCheckInput = document.getElementById('signUpPwCheck');  
  
//비밀번호 확인 입력란에 입력 내용이 변경될 때 이벤트 처리
  signUpPwCheckInput.addEventListener('input', function() {
	const signUpPw = signUpPwInput.value;  
    const signUpPwCheck = signUpPwCheckInput.value;
    
    if (signUpPw === signUpPwCheck) {
      signupMsg_pwCheck.innerHTML = '비밀번호가 일치합니다.';
    } else {
      signupMsg_pwCheck.innerHTML = '비밀번호가 일치하지 않습니다.';
    }
  });

});
