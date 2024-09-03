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
        .table-container {
            margin-top: 20px;
        }
        .btn-create-review {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="my-4">리뷰 목록</h1>

        <a href="<c:url value='/review/createReview?accommodationId=${accommodationId}&userId=${userId}' />" class="btn btn-primary btn-create-review">리뷰 작성하기</a>
        <div class="table-container">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>리뷰 ID</th>
                        <th>평점</th>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성일시</th>
                        <th>상세 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="review" items="${reviews}">
                        <tr>
                            <td>${review.reviewId}</td>
                            <td>${review.rating}</td>
                            <td>${review.userName}</td>
                            <td>${review.content}</td>
                            <td>${review.createdAt}</td>
                            <td>
                                <a href="<c:url value='/review/reviewDetail?reviewId=${review.reviewId}' />" class="btn btn-info btn-sm">상세 보기</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
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
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
