<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	
		getScrapList();
	
	
}

	function getScrapList(){
		let member_no = document.querySelector('#member_no').value;
		fetch('/scrap/list/' + member_no)
		.then(response => response.json())
	    .then(map => scrapView(map));
	}
	
	function scrapView(map){
		let scrapTable = document.querySelector('#scrapTable');
		let list = map.list
		
		list.forEach((scrap,index) =>{
				
			scrapTable.innerHTML +=
				 '<tr>                  '
				+'	<td>'+scrap.class_title+'</td>    '
				+'	<td>'+ scrap.nickname +'</td>  '
				+'	<td>'+ scrap.address +'</td>      '
				+'	<td>'+scrap.class_attach+'</td>     '
				+'	<td>좋아요</td>      '
			    +'                      '
				+'</tr>                 ';
		})
		
		
		
	}
	
	
	
	
</script>

</head>

<body>
<input type="text" name="member_no" id="member_no" value="M000004">
	<table border='1' id="scrapTable">
		<tr>
			<td>강의제목</td>
			<td>강사닉네임</td>
			<td>주소</td>
			<td>이미지</td>
			<td>좋아요</td>
		
		</tr>
		
	</table>

</body>
</html>