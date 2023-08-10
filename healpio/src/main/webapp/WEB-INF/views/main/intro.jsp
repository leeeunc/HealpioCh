<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
	    margin: 0px;
	    padding: 0px;
	    list-style: none;
	    text-decoration: none;
	    color: #000;
	    box-sizing: border-box;
	    font-family: 'Roboto', sans-serif;
	}
	.intro_container{
		margin-top: 30px;
	}
    #intro_img{
        float: left;
        margin: 50px;
    }
    p{
        margin: 50px;
        font-stretch: 1.5px;
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="../common/header.jsp" %>

    <div class='intro_container'>
        <img id='intro_img' src='../resources/images/intro.png'>
        <br><h1>Health Pioneers</h1><br>
        <p>
            Health Pioneers는 건강과 웰빙을 추구하는 회원들과 전문적인 트레이너를 연결해주는 선도적인 운동 중개 서비스입니다. 건강은 우리의 가장 소중한 자산이며 운동은 건강을 증진하고 삶의 질을 향상시키는 데 필수적인 요소이지만, 혼자서는 동기 부여와 지속성이 부족할 수 있습니다. Health Pioneers는 이러한 어려움을 극복하고 회원들이 건강한 삶의 파트너를 찾고자 할 때 필요한 정보를 제공하여 효과적이고 즐거운 운동 경험을 즐길 수 있도록 돕습니다. 운동을 시작하려는 초보자부터 운동 루틴에 변화를 주고자 하는 중급자, 그리고 전문적인 가이드와 도움을 필요로 하는 고급 회원들까지 모두가 자신에게 맞는 트레이너를 찾아 더욱 효과적이고 즐거운 운동 경험을 즐길 수 있습니다.
        </p><br><br><br>

        <h1>Health Pioneers가 주는 이점</h1><br>
        <p>
            <h4>트레이너 매칭의 편의성</h4>
            <br>Health Pioneers는 회원들이 쉽고 빠르게 자신에게 맞는 트레이너를 찾을 수 있도록 편의성을 제공합니다. 회원들은 관심사, 지역 등을 고려하여 자신에게 최적화된 트레이너를 선택할 수 있습니다.
        </p>
        <p>
            <h4>다양한 운동 분야와 전문성</h4>
            <br>Health Pioneers는 다양한 운동 분야를 아우르고 있는 트레이너들과 협력하여 회원들에게 다양한 운동 옵션을 제공합니다. 필라테스, 요가, 러닝, 크로스핏 등 다양한 운동 분야에서 최고 수준의 전문성을 갖춘 트레이너들을 만날 수 있습니다.
        </p>
        <p>
            Health Pioneers는 건강을 추구하는 회원들과 함께 삶의 질을 높이고자 하는 전문적인 트레이너들이 만나 성장하는 플랫폼입니다. 건강한 삶을 위한 최적의 파트너를 찾고, 서로를 격려하며 성장할 수 있는 이 멋진 서비스와 함께하세요! 더욱 건강하고 행복한 삶을 시작해보세요.
        </p>
    </div>
</body>
</html>