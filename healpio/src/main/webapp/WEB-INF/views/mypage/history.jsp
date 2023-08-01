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
	    .then(map => historyView(map));
		
	}
	
	function historyView(map){
		let list = map.history_list;
		let resTable = document.querySelector('#historyTable');
		resTable.innerHTML = '';
		resTable.innerHTML += 
				 '<tr>                '
				+'	<td>강의제목</td>'
				+'	<td>예약날짜</td>'
				+'	<td>예약시간</td>'
				+'	<td>리뷰작성</td>'
		        +'                    '
			    +'                    '
				+'</tr>	             '	;
		
		list.forEach((res,index) => {
			resTable.innerHTML +=
				
				'<tr id="history'+ index +'" data-reservationNo="'+ res.reservation_no +'">                 '
				+'	<td>'+res.class_title+'</td>'
				+'	<td>'+res.reservation_date+'</td>'
				+'	<td>'+res.reservation_time+'</td>'
				+' <td><button>리뷰작성</button></td>'
				+'</tr>                ';
			
		})
		
	}
	

	
</script>

</head>
<body>
<h1>이전 수강 내역</h1>
<input type="text" name="member_no" id="member_no" value="M000004">
<table border='1' id="historyTable">
	
</table>
</body>
</html>