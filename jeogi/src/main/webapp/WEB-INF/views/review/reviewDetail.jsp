<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 상세보기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .review-detail {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .review-detail th {
            width: 20%;
            text-align: left;
        }
        .review-detail td {
            width: 80%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="my-4">리뷰 상세보기</h1>
        <div class="review-detail">
            <table class="table table-bordered">
                <tr>
                    <th>리뷰 ID</th>
                    <td>${review.reviewId}</td>
                </tr>
                <tr>
                    <th>평점</th>
                    <td>${review.rating}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${review.userName}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${review.content}</td>
                </tr>
                <tr>
                    <th>작성일시</th>
                    <td>${review.createdAt}</td>
                </tr>
            </table>
            <a href="<c:url value='/review/reviewList?accommodationId=${review.accommodationId}' />" class="btn btn-primary">리뷰 목록으로 돌아가기</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
