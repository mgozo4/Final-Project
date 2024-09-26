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
    <h1>INQUIRY DETAILS</h1>
    <form action="${path}/inquiry/modify" method="POST">
        <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${inquiry.title}" required /></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${inquiry.user_id}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${inquiry.createdAt}</td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <select name="status">
                        <option value="답변 대기" ${inquiry.status == '답변 대기' ? 'selected' : ''}>답변 대기</option>
                        <option value="답변 완료" ${inquiry.status == '답변 완료' ? 'selected' : ''}>답변 완료</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10" required>${inquiry.content}</textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit" class="btn">수정</button>
                    <form action="${path}/inquiry/delete" method="POST" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                        <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
                        <button type="submit">삭제</button>
                    </form>
                    <a href="${path}/inquiry/list" class="btn">목록으로</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
