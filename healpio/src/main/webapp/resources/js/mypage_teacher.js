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


//모달창 제어
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
		mypageModal.show();
		document.querySelector('.myModalBtn-primary').style.display='none';
		document.querySelector('.myModal-title').innerHTML = '비밀번호 인증 실패';
		document.querySelector('.myModal-body-text').innerHTML = '비밀번호가 일치하지 않습니다.';
	
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