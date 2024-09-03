<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
</head>
<body>
    <h2>회원 가입</h2>
    <form action="${pageContext.request.contextPath}/member/register" method="post">
        <div>
            <label for="id">사용자 ID:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="phone">전화번호:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div>
            <label for="type">사용자 유형:</label>
            <select id="type" name="type">
                <option value="사용자">사용자</option>
                <option value="관리자">관리자</option>
            </select>
        </div>
        <div>
            <button type="submit">등록</button>
        </div>
    </form>
    <div>
        <p>계정을 가지고 계신가요? <a href="${pageContext.request.contextPath}/member/login">로그인</a>하세요.</p>
    </div>
</body>
</html>
