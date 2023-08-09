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

btnEdit.addEventListener('click',function(){
    document.querySelector('#btnEdit').style.display = 'none';
    document.querySelector('#btnGoEdit').style.display = 'inline-block';
    document.querySelector('#btnGoDelete').style.display = 'inline-block';
    
    let inputs = document.getElementsByClassName('info-control');
    
    console.log(inputs);

    for(let i = 0; i < inputs.length; i++){
        inputs[i].readOnly = false;
        
    }
    
});

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
	reservation_container.innerHTML = '';
	
	list.forEach((list, index) => {
		
		reservation_container.innerHTML +=                                           
			 '<div class="content-reservation">                                       '
		   + '    <div class="content-reservation-title"><a>'+ list.class_title +'</a></div>'
		   + '    <div class="content-reservation-date">'+ list.reservation_date +' (월) '+ list.reservation_time +'</div>'
		   + '    <div class="content-reservation-cancel">                            '
		   + '        <button type="button" onclick="deleteReservation('+ index +')" id="deleteBtn'+index+'" data-reservation_no = "'+list.reservation_no+'" class="btn btn-primary">예약취소</button> '
		   + '    </div>                                                              '
		   + '</div>			                                                       '
	})     
	
	 
}

function deleteReservation(index){
	let reservation = document.querySelector('#deleteBtn'+index);
	let reservation_no = reservation.dataset.reservation_no;
	fetch('/mypage/deleteReservation/' + reservation_no)
	.then(response => response.json())
	.then(res => getResList());
}


function preCourseView(map){
	let list = map.preCourseList;
	let preContainer = document.querySelector('.content-prev-container');
	preContainer.innerHTML = '';
	
	list.forEach((list, index) => {
		preContainer.innerHTML +=
		'<div class="content-prev">                                             '
	   + '    <div class="content-prev-title"><a>'+ list.class_title +'</a></div>   '
	   + '    <div class="content-prev-date">'+ list.reservation_date +' (월) 	'+ list.reservation_time +'</div>     '
	   + '    <div class="content-prev-cancel">                                  '
	   + '        <button type="button" class="btn btn-primary">리뷰 작성</button>	'
	   + '    </div>                                                             '
       + '</div>                                                                 '
	})
}


