<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .review-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 15px;
        }
        .review-header {
            margin-bottom: 10px;
        }
        .review-date {
            color: #888;
        }
        .review-actions button {
            margin-right: 5px;
        }
        .comments {
            margin-top: 10px;
        }
        .comment {
            padding: 5px 0;
        }
        .comment-form {
            margin-top: 10px;
        }
        .pagination {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">리뷰 목록</h2>

        <!-- 리뷰 작성 버튼 -->
        <a href="<c:url value='/review/create?accommodationId=1&userId=1' />" class="btn btn-primary mb-4">리뷰 작성</a>

        <!-- 리뷰 목록 -->
        <div id="reviewList">
            <c:forEach items="${reviews}" var="review">
                <div class="review-item">
                    <div class="review-header">
                        <h3>${review.authorName}</h3>
                        <span class="review-date">${review.creationDate}</span>
                    </div>
                    <p>${review.content}</p>
                    <span class="review-rating">평점: ${review.rating}</span>
                    <div class="review-actions">
                        <a href="<c:url value='/review/detail?reviewId=${review.id}' />" class="btn btn-info btn-sm">상세보기</a>
                    </div>
                    <div class="comments">
                        <c:forEach items="${review.comments}" var="comment">
                            <div class="comment">
                                <strong>${comment.authorName}:</strong> ${comment.content}
                            </div>
                        </c:forEach>
                        <div class="comment-form">
                            <form action="<c:url value='/comment/create' />" method="post">
                                <input type="hidden" name="reviewId" value="${review.id}" />
                                <input type="text" name="content" class="form-control" placeholder="댓글 작성하기..." required />
                                <button type="submit" class="btn btn-primary mt-2">댓글 추가</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 페이지네이션 -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageNumber > 1}">
                    <li class="page-item">
                        <a class="page-link" href="?accommodationId=${accommodationId}&page=${pageNumber - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == pageNumber ? 'active' : ''}">
                        <a class="page-link" href="?accommodationId=${accommodationId}&page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageNumber < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="?accommodationId=${accommodationId}&page=${pageNumber + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
