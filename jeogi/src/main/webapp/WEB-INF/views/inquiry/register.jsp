<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 등록</title>
    <style>
        .container {
            width: 800px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            width: 100px;
            text-align: left;
            background-color: #f5f5f5;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>게시글 등록</h1>
    <form action="${pageContext.request.contextPath}/inquiry/register" method="POST">
        <input type="hidden" name="u_no" value="${userInfo.u_no}" />
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" required/></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${userInfo.u_name}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" rows="10" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">게시글 등록</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
