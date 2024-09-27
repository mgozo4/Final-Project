<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- read.jsp -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    .container {
        width: 800px;
        margin: 0 auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
    }
    th {
        background-color: #f4f4f4;
        text-align: left;
    }
    textarea {
        width: 100%;
    }
    .btn {
        display: inline-block;
        padding: 8px 16px;
        margin: 10px 5px 0 0;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }
    .btn:hover {
        background-color: #45a049;
    }
    button {
        padding: 8px 16px;
        background-color: #f44336;
        color: white;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #d32f2f;
    }
</style>

<div class="container">
    <h1>문의 상세보기</h1>
    <table>
        <tr>
            <th>제목</th>
            <td>${inquiry.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${inquiry.user_id}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${inquiry.created_at}</td>
        </tr>
        <tr>
            <th>상태</th>
            <td>${inquiry.status}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${inquiry.content}</td>
        </tr>
        <tr>
             <td colspan="2" style="text-align: center;">
                <form action="${path}/inquiry/modify" method="GET" style="display: inline;">
                    <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
                    <button type="submit" class="btn">수정</button>
                </form>
                <form action="${path}/inquiry/delete" method="POST" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
                    <button type="submit">삭제</button>
                </form>
                <a href="${path}/inquiry/list" class="btn">목록으로</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
