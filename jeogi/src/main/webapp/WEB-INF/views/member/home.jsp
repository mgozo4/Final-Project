<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>홈</title>
</head>
<body>
    <h2>홈 페이지에 오신 것을 환영합니다</h2>
    <c:if test="${not empty member}">
        <p>안녕하세요, ${member.name}님! ${member.type}으로 로그인 중입니다.</p>
        <a href="${pageContext.request.contextPath}/profile">프로필 보기</a>
    </c:if>
    <c:if test="${empty member}">
        <p>로그인이 필요합니다. <a href="${pageContext.request.contextPath}/member/login">로그인</a> 또는 <a href="${pageContext.request.contextPath}/member/register">회원 가입</a>을 진행하세요.</p>
    </c:if>
</body>
</html>
