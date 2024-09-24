<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
</head>
<body>
    <h1>고객센터</h1>

    <!-- FAQ 목록 -->
    <h2>자주 묻는 질문 (FAQ)</h2>
    <ul>
        <c:forEach var="faq" items="${faqList}">
            <li>
                <strong>${faq.question}</strong>
                <p>${faq.answer}</p>
            </li>
        </c:forEach>
    </ul>

    <!-- 1:1 문의하기 -->
    <h2>1:1 문의하기</h2>
    <form action="${pageContext.request.contextPath}/inquiries/add" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="content">문의 내용:</label>
        <textarea id="content" name="content" required></textarea><br><br>

        <label for="inquiryType">문의 유형:</label>
        <select id="inquiryType" name="inquiryType">
            <option value="RESERVATION_CHANGE">예약 변경/취소</option>
            <option value="REFUND">환불</option>
            <option value="FACILITY_ISSUE">시설 불편</option>
            <option value="OTHER">기타</option>
        </select><br><br>

        <button type="submit">문의 접수</button>
    </form>

    <!-- 문의 내역 -->
    <h2>문의 내역</h2>
    <table border="1">
        <thead>
            <tr>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.title}</td>
                    <td>${inquiry.content}</td>
                    <td>${inquiry.createdAt}</td>
                    <td>${inquiry.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
