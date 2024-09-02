<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
    <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
    <h1>리뷰 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>리뷰 ID</th>
                <th>평점</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성일시</th>
                <th>상세 보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr>
                    <td>${review.reviewId}</td>
                    <td>${review.rating}</td>
                    <td>${review.userName}</td>
                    <td>${review.content}</td>
                    <td>${review.createdAt}</td>
                    <td><a href="${pageContext.request.contextPath}/review/detail?reviewId=${review.reviewId}">상세 보기</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/review/create?accommodationId=${accommodationId}&userId=${userId}">리뷰 작성하기</a>
</body>
</html>
