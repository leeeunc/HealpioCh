<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../path-to-your/common-style.css">
    <!-- Link to your common CSS file -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Insert title here</title>
    <style>
        /* Additional styles specific to this page */
        #confirmation-container {
            text-align: center; /* Center the content */
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 800px;
        }

        .confirmation-heading {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .confirmation-button-container {
            text-align: center; /* Center the buttons */
            margin-top: 10px;
        }

        .confirmation-button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .confirmation-button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<c:set var="classVO" value="${ClassVO}" />

<div id="confirmation-container">
    <div class="confirmation-heading">
        예약이 완료 되었습니다
    </div>
    <table>
        <tr>
            <th>강좌명</th>
            <th>강사명</th>
        </tr>
        <tr>
            <td>${classInfo.class_title}</td>
            <td>${classInfo.nickname}</td>
        </tr>
        <tr>
            <th>날짜</th>
            <th>시간</th>
        </tr>
        <tr>
            <td>${date}</td>
            <td>${time}</td>
        </tr>
    </table>
    <div class="confirmation-button-container">
        <c:if test="${memberVo != null}">
            <c:if test="${memberVo.teacheryn == 'Y'}">
                <button class="confirmation-button" onclick="window.location.href='../mypage/teacher?member_no=${memberVo.member_no }'">예약확인</button>
            </c:if>
            <c:if test="${memberVo.teacheryn == 'N'}">
                <button class="confirmation-button" onclick="window.location.href='../mypage/student?member_no=${memberVo.member_no }'">예약확인</button>
            </c:if>
        </c:if>
        <button class="confirmation-button" onclick="window.location.href='http://localhost:8080/class/read?class_no=${class_no}'">돌아가기</button>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
<script src="../resources/js/confirm.js"></script>
</body>
</html>
