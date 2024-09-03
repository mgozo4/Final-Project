<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <div>
            <label for="id">사용자 ID:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <button type="submit">로그인</button>
        </div>
    </form>
    <div>
        <p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/member/register">계정 등록</a>을 진행하세요.</p>
    </div>
</body>
</html>
