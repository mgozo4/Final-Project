<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Inquiry</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
 // 문의 상태 업데이트
    function updateInquiryStatus(inquiry_id, newStatus) {
        $.ajax({
            url: `/inquiries/${inquiryId}/status`,
            method: 'PUT', // PUT 메서드를 사용합니다.
            contentType: 'application/json', // JSON 형태로 전송
            data: JSON.stringify({ status: newStatus }), // 상태를 JSON 형태로 변환하여 전송
            success: function() {
                alert('상태가 성공적으로 업데이트되었습니다.');
                loadInquiries(); // 상태 업데이트 후 목록을 다시 로드
            },
            error: function() {
                alert("상태 업데이트 중 오류가 발생했습니다.");
            }
        });
    }
    </script>
</head>
<body>
    <h2>Inquiry Details</h2>
    <p><strong>Title:</strong> <span id="title"></span></p>
    <p><strong>Content:</strong> <span id="content"></span></p>
    <p><strong>Status:</strong> <span id="status"></span></p>
    <p><strong>Created At:</strong> <span id="created_at"></span></p>
 <a href="/inquiries/list">목록으로 돌아가기</a>
</body>
</html>
