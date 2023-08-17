<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*이미지*/
#form-intro-img{
	position: relative;
	float: left;
	width: 300px;
	max-height: 360px;
	margin-left: 60px;
	margin-top: 30px;
	overflow: hidden;
}
.carousel{
    position: relative;

	display: flex;
	transition: left 0.5s ease-out;
}
.form-intro-img{
	position: relative;
	float: left;
	width: 300px;
	margin-top: 30px;
	margin-bottom: 30px;
	object-fit: cover;
}
#prev {
	border: 0px;
	position: absolute;
	top: 190px;
	left: 60px;
    font-size: 48px;
    line-height: 48px;
    text-align: center;
    opacity: 0.5;
    color: #ccc;
    background-color: transparent;
    cursor : pointer;
    width: 60px;
    height: 60px;
    z-index: 100;
}
#next {
	border: 0px;
	position: absolute;
	top: 190px;
	left: 300px;
    font-size: 48px;
    line-height: 48px;
    text-align: center;
    opacity: 0.5;
    color: #ccc;
    background-color: transparent;
    cursor : pointer;
    width: 60px;
    height: 60px;
    z-index: 100;
}

</style>

<script>
window.addEventListener('load', function(){	
    const prevBtn = document.querySelector('#prev');
    const nextBtn = document.querySelector('#next');
    const carousel = document.querySelector('.carousel');

    let index = 0;

    // let interval = setInterval(function(){
    //     imgChange();
    // }, 2000)

    function imgChange(){
        index++;
        if (index>2) {
            index = 0;
        };        
        carousel.style.left= -300 * index + 'px';
    }

    prevBtn.addEventListener('click', () => {
        if(index==0){
            return;
        }
        index--;	   
        carousel.style.left = -300 * index + 'px';
    });

    nextBtn.addEventListener('click', () => {
        if(index==2) {
            index=0;
            carousel.style.left = '0px';
            return;
        }
        index++;
        carousel.style.left = -300 * index + 'px';
    });
})
     

</script>
</head>
<body>


					<div>
					    <div id="form-intro-img">
					        <div class="carousel" style='left:0px'>
	     	<c:forEach items="${list}" var="li" varStatus="status">
					 				<img src=
										"<c:url value="/display">
										<c:param name="fileName" value="${li.boardFile }"/>
										</c:url>" 
										alt="${li.class_title}" class="form-intro-img"
										width="300" height="300"/> 
		  </c:forEach>
					        </div>
					    </div>
					    <button id="prev" type="button">&lang;</button>
					    <button id="next" type="button">&rang;</button>
					</div>

</body>
</html>