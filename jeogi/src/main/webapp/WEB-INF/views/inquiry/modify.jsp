<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>문의 수정</title>
    <style>
        form {
            margin: 20px 0;
        }
        label {
            display: inline-block;
            width: 70px;
        }
        input[type="text"], textarea, select {
            width: 400px;
        }
        div {
            margin-bottom: 15px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            margin-left: 10px;
            text-decoration: none;
            color: #0000EE;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>문의 수정</h2>

    <form action="${path}/inquiry/modify" method="post">
        <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}">
        <div>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" value="${inquiry.title}" required>
        </div>
        <div>
            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="10" cols="50" required>${inquiry.content}</textarea>
        </div>
        <div>
            <label for="status">상태:</label>
            <select id="status" name="status">
                <option value="답변 대기" ${inquiry.status == '답변 대기' ? 'selected' : ''}>답변 대기</option>
                <option value="답변 완료" ${inquiry.status == '답변 완료' ? 'selected' : ''}>답변 완료</option>
            </select>
        </div>
        <div>
           <input type="submit" value="수정 완료">
        </div>
    </form>
</body>
</html>
