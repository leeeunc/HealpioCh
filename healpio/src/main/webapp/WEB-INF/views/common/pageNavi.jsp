<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go(page){
		document.searchForm.pageNo.value = page;
		document.searchForm.submit();
	}
</script>
</head>
<body>
<%-- Criteria 객체 가져오기 --%>
<c:set var="cri" value="${pageDto.cri}" />

<%-- 총 페이지 수 계산 --%>
<c:set var="totalPages" value="${(pageDto.realEnd > 0) ? pageDto.realEnd : 1}" />

<%-- 현재 페이지 번호 가져오기 --%>
<c:set var="currentPage" value="${cri.pageNo}" />

<%-- 페이지 번호 출력 --%>
<div class="pagination">
    <c:if test="${pageDto.prev}">
        <a href="#" onclick="go(${pageDto.startNo - 1})">이전</a>
    </c:if>

    <c:forEach begin="${pageDto.startNo}" end="${pageDto.endNo}" var="pageNum">
        <c:choose>
            <c:when test="${pageNum eq currentPage}">
                <strong>${pageNum}</strong>
            </c:when>
            <c:otherwise>
                <a href="#" onclick="go(${pageNum})">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${pageDto.next}">
        <a href="#" onclick="go(${pageDto.endNo + 1})">다음</a>
    </c:if>
</body>
</html>
