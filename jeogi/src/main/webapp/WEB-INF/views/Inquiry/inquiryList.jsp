<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>문의 목록</title>
    <script>
        $(document).ready(function() {
            // 문의 목록 가져오기
            function loadInquiries() {
                $.ajax({
                    url: '/inquiries',
                    method: 'GET',
                    success: function(inquiries) {
                        var tableBody = $("#inquiryTable tbody");
                        tableBody.empty(); // 기존 내용 삭제
                        inquiries.forEach(function(inquiry) {
                            var row = `<tr>
                                <td>${inquiry.inquiry_id}</td>
                                <td>${inquiry.title}</td>
                                <td>${inquiry.status}</td>
                                <td>${inquiry.created_at}</td>
                                <td><a href="/inquiries/${inquiry.inquiry_id}">상세 보기</a></td>
                                <td>
                                    <select class="status-select" data-id="${inquiry.inquiry_id}">
                                    <c:if test="${not empty inquiry}">
                                    <option value="답변 대기" ${inquiry.status == '답변 대기' ? 'selected' : ''}>답변 대기</option>
                                    <option value="답변 완료" ${inquiry.status == '답변 완료' ? 'selected' : ''}>답변 완료</option>
                                    <option value="거절" ${inquiry.status == '거절' ? 'selected' : ''}>거절</option>
                                </c:if>
                                <c:if test="${empty inquiry}">
                                    <option value="">조회할 수 없습니다.</option>
                                </c:if>
                                    </select>
                                </td>
                            </tr>`;
                            tableBody.append(row);
                        });

                        // 상태 변경 이벤트 핸들러 추가
                        $(".status-select").change(function() {
                            var inquiryId = $(this).data('id');
                            var newStatus = $(this).val();
                            updateInquiryStatus(inquiryId, newStatus);
                        });
                    },
                    error: function() {
                        alert("문의 목록을 불러오는 중 오류가 발생했습니다.");
                    }
                });
            }

            // 문의 상태 업데이트
            function updateInquiryStatus(inquiryId, newStatus) {
                $.ajax({
                    url: `/inquiries/${inquiryId}/status`,
                    method: 'PUT',
                    data: { status: newStatus },
                    success: function() {
                        alert('상태가 성공적으로 업데이트되었습니다.');
                        loadInquiries(); // 상태 업데이트 후 목록을 다시 로드
                    },
                    error: function() {
                        alert("상태 업데이트 중 오류가 발생했습니다.");
                    }
                });
            }

            // 페이지 로드 시 문의 목록을 불러옴
            loadInquiries();
        });
    </script>
</head>
<body>
    <h2>모든 문의 목록</h2>
    <table id="inquiryTable" border="1">
        <thead>
            <tr>
                <th>문의 ID</th>
                <th>제목</th>
                <th>상태</th>
                <th>작성 일시</th>
                <th>작업</th>
                <th>상태 변경</th>
            </tr>
        </thead>
        <tbody>
            <!-- AJAX가 이 부분을 채웁니다 -->
        </tbody>
    </table>
</body>
</html>
