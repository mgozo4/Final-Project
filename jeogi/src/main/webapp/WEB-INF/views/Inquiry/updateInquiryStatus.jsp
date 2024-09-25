<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 상태 업데이트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function updateStatus(inquiry_id) {
            // 선택된 상태 값을 가져옴
            var status = $("#status").val();
            
            $.ajax({
                url: '/inquiries/' + inquiry_id + '/status', // 상태 업데이트 요청을 보낼 URL
                method: 'PUT',  // HTTP PUT 메서드 사용
                data: { status: status },  // 서버로 보낼 데이터 (상태)
                success: function() {
                    alert("상태가 성공적으로 업데이트되었습니다.");
                    window.location.href = '/inquiries/list';  // 상태 업데이트 후 목록 페이지로 이동
                },
                error: function() {
                    alert("상태 업데이트 중 오류가 발생했습니다.");
                }
            });
        }
    </script>
</head>
<body>
    <h2>문의 상태 업데이트</h2>
    <form onsubmit="event.preventDefault(); updateStatus(${inquiry_id});">
        <label for="status">상태:</label>
        <select id="status">
            <option value="답변 대기">답변 대기</option>
            <option value="답변 완료">답변 완료</option>
        </select><br><br>

        <button type="submit">상태 업데이트</button>
    </form>
    <a href="/inquiry/inquiryList">목록으로 돌아가기</a>
</body>
</html>
