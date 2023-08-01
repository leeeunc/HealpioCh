<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
			getResList();
		
		
	}
	
	function getResList(){
		let member_no = document.querySelector('#member_no').value;
		
		fetch('/reservation/list/' + member_no)
		.then(response => response.json())
	    .then(map => reservationView(map));
		
	}
	
	function reservationView(map){
		let list = map.reservation_list;
		let resTable = document.querySelector('#reservationTable');
		resTable.innerHTML = '';
		resTable.innerHTML += 
				 '<tr>                '
				+'	<td>강의제목</td>'
				+'	<td>예약날짜</td>'
				+'	<td>예약시간</td>'
				+'	<td>예약취소</td>'
		        +'                    '
			    +'                    '
				+'</tr>	             '	;
		
		list.forEach((res,index) => {
			resTable.innerHTML +=
				
				'<tr id="reservation'+ index +'" data-reservationNo="'+ res.reservation_no +'">                 '
				+'	<td>'+res.class_title+'</td>'
				+'	<td>'+res.reservation_date+'</td>'
				+'	<td>'+res.reservation_time+'</td>'
				+' <td><button onclick="reservationDelete('+ index +')">예약취소</button></td>'
				+'</tr>                ';
			
		})
		
	}
	
	function reservationDelete(index){
		console.log(index);
		let no = document.querySelector('#reservation'+index) ;
		let reservation_no = no.dataset.reservationno;
		
		fetch('/reservation/delete/' + reservation_no)
		.then(response => response.json())
	    .then(map => getResList());
		
		
		
	}
	
</script>

</head>
<body>
<h1>예약</h1>
<input type="text" name="member_no" id="member_no" value="M000004">
<table border='1' id="reservationTable">
	
</table>
</body>
</html>