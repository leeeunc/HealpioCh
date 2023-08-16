const passwordModal = new bootstrap.Modal('#passwordModal', {
		  keyboard: false
		})

const mypageModal = new bootstrap.Modal('#myModal', {
	keyboard: false
})

function showContent(contentType) {
    console.log(contentType);

    const contentTypes = ['info', 'register', 'reservation', 'prev'];
    const contentContainers = {
        info: document.querySelector('.content-info'),
        register: document.querySelector('.content-register-container'),
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
	
	fetch('/mypage/teacher/reservation/'+ member_no)
	.then(response => response.json())
	.then(map => reservationView(map));
	
	fetch('/mypage/teacher/history/'+ member_no)
	.then(response => response.json())
	.then(map => preBooksView(map));
}

function reservationView(map){
	let list = map.teacher_resList;
	
	let reservation_container = document.querySelector('.content-reservation-container');
	reservation_container.innerHTML = '';
	
	list.forEach((list, index) => {
		
		reservation_container.innerHTML +=                                           
			'<div class="content-reservation">                                                 '
		   +'    <div class="content-reservation-title"><a href="/class/read?class_no='+list.class_no+'">'+list.class_title+'</a></div>       		'
		   +'    <div class="content-reservation-info">                                        '
		   +'        <div class="content-reservation-date">'+ list.reservation_date +' '+ list.reservation_time +'</div>  		'
		   +'        <div class="content-reservation-member">'+list.nickname+' 회원님 ｜ '+list.phonenumber+'</div>		'
		   +'    </div>                                                                        '
		   +'    <div class="content-reservation-cancel">                                      '
		   +'        <button type="button" onclick="deleteReservation('+ index +')" id="deleteBtn'+index+'" data-reservation_no = "'+list.reservation_no+'" class="btn btn-primary">예약취소</button>           '
		   +'    </div>                                                                        '
		   +'</div>	                                                                         '
	})     
	
	
}

function deleteReservation(index){
	let reservation = document.querySelector('#deleteBtn'+index);
	let reservation_no = reservation.dataset.reservation_no;
	
	document.querySelector('.myModal-title').innerHTML = '예약 취소';
	document.querySelector('.myModal-body-text').innerHTML = '정말 이 회원님의 예약을 취소하시겠습니까?';
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

function preBooksView(map){
	let list = map.preBooksList;
	let preContainer = document.querySelector('.content-prev-container');
	preContainer.innerHTML = '';
	
	list.forEach((list, index) => {
		preContainer.innerHTML +=
			`<div class="content-prev">
			    <div class="content-prev-title"><a href="/class/read?class_no=${list.class_no}">${list.class_title}</a></div>
			    <div class="content-prev-info">
			        <div class="content-prev-date">${list.reservation_date} ${list.reservation_time}</div>
			        <div class="content-prev-member">${list.nickname} 회원님 ｜ ${list.phonenumber}</div>
			    </div>
			    <div class="content-prev-review">
			        <button type="button" class="btn btn-primary" onclick="location.href='/class/read?class_no=${list.class_no}'">리뷰 확인</button>
			    </div>
			</div>
			`;
		
	})
}


function myPasswordValidate(){
	let password = document.querySelector('#password').value;
	let passwordCheck = document.querySelector('#passwordCheck').value;
	let passwordError = document.querySelector('#passwordError');
	let passwordCheckError = document.querySelector('#passwordCheckError');
	let btnPwEdit = document.querySelector('#btnPwEdit');
	
	
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