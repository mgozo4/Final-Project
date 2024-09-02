<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세보기</title>
    <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
    <h1>리뷰 상세보기</h1>
    <table border="1">
        <tr>
            <th>리뷰 ID</th>
            <td>${review.reviewId}</td>
        </tr>
        <tr>
            <th>평점</th>
            <td>${review.rating}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${review.userName}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${review.content}</td>
        </tr>
        <tr>
            <th>작성일시</th>
            <td>${review.createdAt}</td>
        </tr>
    </table>
    <a href="${pageContext.request.contextPath}/review/list?accommodationId=${review.accommodationId}">리뷰 목록으로 돌아가기</a>
</body>
</html>
