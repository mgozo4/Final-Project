<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script>
	let msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
</script>
</head>
<body>
  <div>
        <ul>
            <li><a href="${contextPath}/member/home">홈</a></li>
            <c:choose>
                <c:when test="${not empty sessionScope.member}">
                    <li>
                        <a href="${contextPath}/member/profile">${sessionScope.member.name}</a>님 방가 //(- -)
                    </li>
                    <li>
                        <a href="${contextPath}/member/logout">로그아웃</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="${contextPath}/member/login">로그인</a></li>
                    <li><a href="${contextPath}/member/register">회원가입</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>
