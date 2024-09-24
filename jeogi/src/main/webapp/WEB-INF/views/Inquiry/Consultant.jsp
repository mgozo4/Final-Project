<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상담원 관리 시스템</title>
</head>
<body>
    <h1>상담원 관리 시스템</h1>

    <h2>고객 문의 내역</h2>
    <table>
        <thead>
            <tr>
                <th>문의 ID</th>
                <th>제목</th>
                <th>고객</th>
                <th>상태</th>
                <th>답변</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="inquiry : ${inquiries}">
                <td th:text="${inquiry.inquiryId}"></td>
                <td th:text="${inquiry.title}"></td>
                <td th:text="${inquiry.customer.name}"></td>
                <td th:text="${inquiry.status}"></td>
                <td>
                    <form action="/consultant/answer" method="post">
                        <textarea name="responseContent" required></textarea>
                        <input type="hidden" name="inquiryId" th:value="${inquiry.inquiryId}">
                        <button type="submit">답변 전송</button>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
