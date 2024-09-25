<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 제출</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 1:1 문의 제출 함수
        function submitOneOnOneInquiry() {
            var inquiry = {
                user_id: $("#user_id").val(),   // 사용자 ID
                title: $("#title").val(),       // 문의 제목
                content: $("#content").val(),   // 문의 내용
                status: "답변 대기"            // 초기 상태를 '답변 대기'로 설정
            };
            $.ajax({
                url: '/inquiries/one-on-one',  // 문의 제출을 처리하는 서버 경로
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(inquiry),  // 문의 데이터를 JSON으로 변환하여 전송
                success: function() {
                    alert("1:1 문의가 성공적으로 제출되었습니다.");
                    window.location.href = '/inquiries/list';  // 성공 시 목록 페이지로 리다이렉트
                },
                error: function() {
                    alert("1:1 문의 제출 중 오류가 발생했습니다.");
                }
            });
        }
    </script>
</head>
<body>
    <h2>1:1 문의 제출</h2>
    <form onsubmit="event.preventDefault(); submitOneOnOneInquiry();">
        <label for="user_id">사용자 ID:</label>
        <input type="text" id="user_id" required><br><br>

        <label for="title">제목:</label>
        <input type="text" id="title" required><br><br>

        <label for="content">내용:</label>
        <textarea id="content" required></textarea><br><br>

        <button type="submit">문의 제출</button>
    </form>
</body>
</html>
