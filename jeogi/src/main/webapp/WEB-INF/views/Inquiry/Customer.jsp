<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
</head>
<body>
    <h1>고객센터</h1>

    <h2>자주 묻는 질문 (FAQ)</h2>
    <ul>
        <li th:each="faq : ${faqList}">
            <strong th:text="${faq.question}"></strong>
            <p th:text="${faq.answer}"></p>
        </li>
    </ul>

    <h2>1:1 문의하기</h2>
    <form action="/inquiries/add" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>

        <label for="content">문의 내용:</label>
        <textarea id="content" name="content" required></textarea>

        <label for="inquiryType">문의 유형:</label>
        <select id="inquiryType" name="inquiryType">
            <option value="RESERVATION_CHANGE">예약 변경/취소</option>
            <option value="REFUND">환불</option>
            <option value="FACILITY_ISSUE">시설 불편</option>
            <option value="OTHER">기타</option>
        </select>

        <button type="submit">문의 접수</button>
    </form>

    <h2>문의 내역</h2>
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="inquiry : ${inquiries}">
                <td th:text="${inquiry.title}"></td>
                <td th:text="${inquiry.content}"></td>
                <td th:text="${inquiry.createdAt}"></td>
                <td th:text="${inquiry.status}"></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
