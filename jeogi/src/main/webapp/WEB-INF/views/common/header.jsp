<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <title>My Website</title>
    <script>
        let msg = '${msg}';
        if (msg) {
            alert(msg);
        }
    </script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${contextPath}/member/home">홈</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${not empty sessionScope.member}">
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/member/profile">${sessionScope.member.name}님 방가 //(- -)</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/member/logout">로그아웃</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/member/login">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/member/register">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<script src="${contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
