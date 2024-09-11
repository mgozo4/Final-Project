<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="이름" required />
            <input type="email" name="email" placeholder="이메일" required />
            <input type="password" name="password" placeholder="비밀번호" required />
            <input type="tel" name="phone" placeholder="전화번호" required />
            <button type="submit" class="btn">회원가입</button>
        </form>
        <div class="footer">
            <p>이미 계정이 있으신가요? <a href="login.jsp">로그인</a></p>
        </div>
    </div>
</body>
</html>