const passwordModal = new bootstrap.Modal('#passwordModal', {
		  keyboard: false
		});
const mypageModal = new bootstrap.Modal('#myModal', {
	keyboard: false
});


function showContent(contentType) {
    console.log(contentType);

    const contentTypes = ['info', 'scrap', 'reservation', 'prev'];
    const contentContainers = {
        info: document.querySelector('.content-info'),
        scrap: document.querySelector('.content-scrap-container'),
        reservation: document.querySelector('.content-reservation-container'),
        prev: document.querySelector('.content-prev-container'),
    };

    contentTypes.forEach((type) => {
        const container = contentContainers[type];
        if (type === contentType) {
            container.style.display = 'block';
        } else {
            container.style.display = 'none';
        }
    });
}


window.onload = function(){
	getList();
	
	
	
}

function getList(){
	let member_no = document.querySelector('#member_no').value;
	
	fetch('/mypage/student/reservation/'+ member_no)
	.then(response => response.json())
	.then(map => reservationView(map));
	
	fetch('/mypage/student/history/'+ member_no)
	.then(response => response.json())
	.then(map => preCourseView(map));
	
	
}

function reservationView(map){
	let list = map.student_resList;
	
	let reservation_container = document.querySelector('.content-reservation-container');
	reservation_container.innerHTML = '<div class="reservation-title">예약 확인</div>';
	
	list.forEach((list, index) => {
		
		reservation_container.innerHTML +=                                           
			 '<div class="content-reservation">                                       '
		   + '    <div class="content-reservation-title"><a href="/class/read?class_no='+list.class_no+'">'+ list.class_title +'</a></div>'
		   + '    <div class="content-reservation-date">'+ list.reservation_date +' '+ list.reservation_time +'</div>'
		   + '    <div class="content-reservation-cancel">                            '
		   + '        <button type="button" onclick="deleteReservation('+ index +')" id="deleteBtn'+index+'" data-reservation_no = "'+list.reservation_no+'" class="btn btn-primary">예약취소</button> '
		   + '    </div>                                                              '
		   + '</div>			                                                       '
	})     
	
	 
}

function deleteReservation(index){
	let reservation = document.querySelector('#deleteBtn'+index);
	let reservation_no = reservation.dataset.reservation_no;
	
	document.querySelector('.myModal-title').innerHTML = '예약 취소';
	document.querySelector('.myModal-body-text').innerHTML = '정말 예약을 취소하시겠습니까?';
	mypageModal.show();
	
	let primaryBtn = document.querySelector('.myModalBtn-primary');
	
	
	primaryBtn.addEventListener('click',function(){
		document.querySelector('.myModal-title').innerHTML = '예약 취소';
		document.querySelector('.myModal-body-text').innerHTML = '예약이 취소되었습니다.';
		
		fetch('/mypage/deleteReservation/' + reservation_no)
		.then(response => response.json())
		.then(res => getList());
		
		mypageModal.show();
		
		primaryBtn.addEventListener('click',function(){
			mypageModal.hide();
		})
		
		
		
		
	})
	
	getList();
	
}


function preCourseView(map){
	let list = map.preCourseList;
	let preContainer = document.querySelector('.content-prev-container');
	let member_no = document.querySelector('#member_no').value;
	let reviewUrl = '/review/write?member_no=' + member_no + '&class_no=';
	preContainer.innerHTML = '<div class="prev-title">이전 예약 내역</div>';
	
	
	
	list.forEach((list, index) => {
		preContainer.innerHTML +=			
		    `<div class="content-prev">
		        <div class="content-prev-title"><a href="/class/read?class_no=${list.class_no}">${list.class_title}</a></div>
		        <div class="content-prev-date">${list.reservation_date} ${list.reservation_time}</div>
		        <div class="content-prev-cancel">
		            <button type="button" id="writeReviewBtn" class="btn btn-primary" onclick="location.href='/review/write?class_no=${list.class_no}&member_no=${member_no}'">리뷰 작성</button>
		        </div>
		    </div>`
		
		
	})
}


document.querySelector('#btnInfoEdit').addEventListener('click', function(){
	let info_input = document.querySelectorAll('.info-input');
	document.querySelector('#btnInfoEdit').style.display = 'none';
	document.querySelector('#btnGoEdit').style.display = 'inline-block';
	document.querySelector('#btnCancle').style.display = 'inline-block';
	document.querySelector('#mail-Check-Btn').style.display = 'inline-block';
	
	for(let i = 0; i < info_input.length; i++){
	    info_input[i].style.border='1px solid black';
	    info_input[i].readOnly = '';
	    
	}
	
})

// 휴대번호 변경
document.querySelector('#phoneEdit').addEventListener('click',function(){
	document.querySelector('.phonenumber-input').style.border = '1px solid black';
	
	document.querySelector('#phonenumber-Check-Btn').style.display = 'inline-block';
	document.querySelector('.phonenumber-check-box').style.display = 'block';
	
	document.querySelector('#phoneEdit').style.display = 'none';
	document.querySelector('#phonenumberEdit').style.display = 'inline-block';
	document.querySelector('#phonenumberCancle').style.display = 'inline-block';
	
	document.querySelector('.phonenumber-input').readOnly = '';
	
});

let phone_check_number = '000000';


document.querySelector('#phonenumber-Check-Btn').addEventListener('click', function(){
	let phonenumber = document.querySelector('#phonenumber').value;
	let resultMsg = document.querySelector('#phonenumber-check-warn');
	
	fetch("/mypage/sendSms?phonenumber="+phonenumber)
	.then(response => response.json())
	.then(map => {
		alert("인증번호가 전송되었습니다.");
		phone_check_number = map.number;
		document.querySelector('.phonenumber-check-input').disabled = false;
		document.querySelector('.phonenumber-check-button').addEventListener('click', function(){
			let inputCode = document.querySelector('.phonenumber-check-input').value;
			
			if(phone_check_number == inputCode){
				//document.querySelector('.phonenumber-check-button').style.display = 'none';
				resultMsg.style.color = '#3CB371';
		        resultMsg.innerHTML = '<i class="fa-solid fa-circle-check"></i>';
		        alert('인증되었습니다.');
			}else{
				resultMsg.innerHTML = '인증번호가 불일치 합니다. 다시 확인해주세요!';
		        resultMsg.style.color = 'red';
			}
		})
	})
	
	
})

function myPhonenumberValidate(){
	let inputCode = document.querySelector('.phonenumber-check-input').value
	let resultMsg = document.querySelector('#phonenumber-check-warn');
	
	
	if(resultMsg.innerHTML === '<i class="fa-solid fa-circle-check"></i>' && phone_check_number === inputCode){
		alert('전화번호가 변경되었습니다.');
		return true;
	}else{
		alert('이메일 또는 인증번호를 확인해주세요.')
		resultMsg.innerHTML = '인증번호가 불일치 합니다. 다시 확인해주세요!';
        resultMsg.style.color = 'red';
		return false;
	}
	
}




// 기본이벤트 제거
document.querySelector('#phonenumber-Check-Btn').addEventListener('click', function(e){
	e.preventDefault();
})
document.querySelector('.phonenumber-check-button').addEventListener('click', function(e){
	e.preventDefault();
})

// 이메일 변경

let mailCheckBtn = document.querySelector('#mail-Check-Btn');
let checkInput = document.querySelector('.mail-check-input');

mailCheckBtn.addEventListener('click', function(){
	let email = document.querySelector('#userEmail').value;
	document.querySelector('.mail-check-input').style.display='inline-block';
	document.querySelector('.mail-check-button').style.display='inline-block';
	document.querySelector('#mail-check-warn').innerHTML = '인증번호 6자리를 입력해주세요.';
	
	fetch("/mypage/mailCheck?email="+email)
	.then(response => {
	        if (!response.ok) {
	            throw new Error('Network response was not ok');
	        }
	        return response.text();
	    })
	.then(data => {
		console.log("data : " + data);
		checkInput.disabled = false;
		code = data;
		alert('인증번호가 전송되었습니다.');
	})
	
	
})

document.querySelector('.mail-check-button').addEventListener('click', function() {
    let inputCode = checkInput.value;
    let resultMsg = document.getElementById('mail-check-warn');
    let userEmail = document.getElementById('userEamil');
  
    
    if (inputCode === code) {
    	resultMsg.style.color = '#3CB371';
        resultMsg.innerHTML = '<i class="fa-solid fa-circle-check"></i>';
      
        mailCheckBtn.disabled = true;
        userEmail.readOnly = true;
        
        
        userEmailSelect.onfocus = function() {
            this.initialSelect = this.selectedIndex;
        };
        userEmailSelect.onchange = function() {
            this.selectedIndex = this.initialSelect;
        };
    } else {
        resultMsg.innerHTML = '인증번호가 불일치 합니다. 다시 확인해주세요!';
        resultMsg.style.color = 'red';
    }

})


// 기본이벤트 제거
document.querySelector('#mail-Check-Btn').addEventListener('click', function(e){
	e.preventDefault();
})
document.querySelector('.mail-check-button').addEventListener('click', function(e){
	e.preventDefault();
})

function myEmailValidate(){
	let resultMsg = document.getElementById('mail-check-warn').innerHTML;
	if(resultMsg == '<i class="fa-solid fa-circle-check"></i>'){
		alert('이메일이 수정되었습니다.');
		return true;
	}else{
		alert('이메일 또는 인증번호를 다시 확인해주세요.');
		return false;
	}
}


// 비밀번호 변경
document.querySelector('#btnPwEdit').addEventListener('click',function(){
	document.querySelector('#btnPwEdit').style.display = 'none';
	document.querySelector('#btnGoPwEdit').style.display = 'inline-block';
	document.querySelector('#btnPwCancle').style.display = 'inline-block';
	
	document.querySelector('#password').readOnly = '';
	document.querySelector('#passwordCheck').readOnly = '';
})
 

function myPasswordValidate(){
	let password = document.querySelector('#password').value;
	let passwordCheck = document.querySelector('#passwordCheck').value;
	let passwordError = document.querySelector('#passwordError');
	let passwordCheckError = document.querySelector('#passwordCheckError');
	let btnPwEdit = document.querySelector('.btnGoEdit');
	
	
	 let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
     if (!passwordPattern.test(password)) {
    	 passwordError.style.color = 'red';
         passwordError.innerHTML = "비밀번호는 영문과 숫자 조합으로 6~12글자여야 합니다.";
         btnPwEdit.disabled = 'true';
         return false;
     } else {
    	 passwordError.style.color = '#3CB371'
         passwordError.innerHTML = "<i class='fa-solid fa-circle-check'></i>";
     }
     
     // 비밀번호 확인 검사
     if (password !== passwordCheck || passwordCheck == '') {
    	 passwordCheckError.style.color = 'red'
    	 passwordCheckError.innerHTML = "비밀번호가 일치하지 않습니다.";
    	 btnPwEdit.disabled = 'true';
         return false;
     } else {
    	 passwordCheckError.style.color = '#3CB371'
    	 passwordCheckError.innerHTML = "<i class='fa-solid fa-circle-check'></i>";
     }
     
     if(passwordPattern.test(password) && password === passwordCheck){
    	 btnPwEdit.disabled = '';
     }
     
      return true;
}

function submitForm(){
	 alert("비밀번호가 변경되었습니다.");
}



/*
// 모달창 제어
btnEdit.addEventListener('click',function(){
	
	
	passwordModal.show();

});


pwCheckBtn.addEventListener('click',function(){
	
	let member_no = document.querySelector('#member_no').value;
	let member_pw = document.querySelector('#password-input-box').value;
	
	fetch('/mypage/passwordCheck'
			, {method : 'post'
				, headers : {'Content-Type' : 'application/json'}
				, body : JSON.stringify({
				    member_no: member_no,
				    member_pw: member_pw,
				  })
			})
		// 5. 응답처리
		.then(response => response.json())
		.then(map => passwordCheck(map));
			
		passwordModal.hide();
})

function passwordCheck(map){
	let res = map.passwordCheck;
	console.log(res);
	
	if(res === true){
		document.querySelector('#btnEdit').style.display = 'none';
	    document.querySelector('#btnGoEdit').style.display = 'inline-block';
	    document.querySelector('#btnGoDelete').style.display = 'inline-block';
	    document.querySelector('.password').style.display = 'block';
	    document.querySelector('.passwordCheck').style.display = 'block';
	    
	    let inputs = document.getElementsByClassName('info-control');
	    
	    console.log(inputs);

	    for(let i = 0; i < inputs.length; i++){
	        inputs[i].readOnly = false;
	        
	    }
	  }else{
		alert('비밀번호가 일치하지 않습니다.');
		 
	
    }
}


document.getElementById('btnGoEdit').addEventListener('click', function(e) {
    var pw1 = document.getElementById('member_pw1').value;
    var pw2 = document.getElementById('member_pw2').value;
    
    if (pw1 !== pw2) {
        alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        e.preventDefault(); // 폼 제출을 막음
    }
    
});

*/



