<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원정보</title>
</head>
<body>
    <h2>프로필</h2>
    <c:if test="${not empty member}">
        <div>
            <p><strong>User ID:</strong> ${member.id}</p>
            <p><strong>Email:</strong> ${member.email}</p>
            <p><strong>Name:</strong> ${member.name}</p>
            <p><strong>Phone:</strong> ${member.phone}</p>
            <p><strong>Type:</strong> ${member.type}</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/update">프로필 수정</a>
        </div>
    </c:if>
    <c:if test="${empty member}">
        <p>Please <a href="${pageContext.request.contextPath}/login">login</a> 프로필 보여줘</p>
    </c:if>
</body>
</html>
