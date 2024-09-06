<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>프로필 수정</title>
</head>
<body>
    <h2>프로필 수정</h2>
    <c:if test="${not empty member}">
        <form action="${pageContext.request.contextPath}/member/updateProfile" method="post">
            <input type="hidden" name="user_id" value="${member.user_id}">
            <div>
                <label for="id">사용자 ID:</label>
                <input type="text" id="id" name="id" value="${member.id}" readonly>
            </div>
            <div>
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" value="${member.email}" required>
            </div>
            <div>
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" placeholder="비밀번호 변경 시 입력" required>
            </div>
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${member.name}" required>
            </div>
            <div>
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="phone" value="${member.phone}" required>
            </div>
            <div>
                <label for="type">사용자 유형:</label>
                <select id="type" name="type">
                    <option value="사용자" <c:if test="${member.type == '사용자'}">selected</c:if>>사용자</option>
                    <option value="관리자" <c:if test="${member.type == '관리자'}">selected</c:if>>관리자</option>
                </select>
            </div>
            <div>
                <button type="submit">수정</button>
            </div>
        </form>
    </c:if>
    <c:if test="${empty member}">
        <p>로그인 후 프로필을 수정할 수 있습니다. <a href="${pageContext.request.contextPath}/member/login">로그인</a>하세요.</p>
    </c:if>
</body>
</html>
